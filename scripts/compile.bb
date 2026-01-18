#!/usr/bin/env bb
(ns compile
  (:require
   [babashka.http-client :as client]
   [cheshire.core :as json]
   [clojure.string :as str]))

(defn find-checksum [checksums pattern]
  (some
   (fn [[file checksum]]
     (when (re-matches pattern file)
       checksum))
   checksums))

(defn parse-checksums [checksums]
  {:macos-arm-sha (find-checksum checksums #".*macos-arm.*")
   :macos-amd-sha (find-checksum checksums #".*macos-amd.*")

   :linux-arm-sha (find-checksum checksums #".*linux-arm.*")
   :linux-amd-sha (find-checksum checksums #".*linux-amd.*")})

(defn download-checksums [owner repo version]
  (let [url (str "https://github.com/"
                 owner "/" repo
                 "/releases/download/"
                 version
                 "/checksums.txt")

        lines (-> (client/get url)
                  :body
                  (str/split #"\n"))

        checksums
        (into {}
              (map (fn [line]
                     (let [[hash file] (str/split line #"\s+")]
                       [file hash])))
              lines)]
    (parse-checksums checksums)))

(defn query-release-info [owner repo]
  (let [release-url (str "https://api.github.com/repos/" owner "/" repo "/releases/latest")]
    (-> (client/get release-url)
        :body
        (json/parse-string true)
        :tag_name)))

(defn compile-template [{:keys [owner repo template version checksums]}]
  (let [template-file (str template ".rb")
        template-data (slurp (str "templates/" template-file))
        platforms [["macos" "arm64"]
                   ["macos" "amd64"]

                   ["linux" "arm64"]
                   ["linux" "amd64"]]

        urls
        (reduce
         (fn [urls [os arch]]
           (let [url (str "https://github.com/" owner "/" repo
                          "/releases/download/" version "/"
                          repo "-" os "-" arch)
                 key (keyword (str os "-" arch "-url"))]
             (assoc urls key url)))
         {}
         platforms)

        vars (merge {:version (str/replace version #"v" "")}
                    checksums
                    urls)

        replaced
        (reduce
         (fn [template [key value]]
           (str/replace
            template
            (re-pattern (str "\\{\\{" (name key) "\\}\\}"))
            value))

         template-data
         vars)]

    (spit (str "Formula/" template-file) replaced)))

(defn main [owner repo]
  (let [version (query-release-info owner repo)
        checksums (download-checksums owner repo version)]
    (compile-template {:owner owner
                       :repo repo

                       :template repo
                       :version version
                       :checksums checksums})
    (println (str "Update " repo " to " version))))

(main (first *command-line-args*)
      (second *command-line-args*))
