(use '[clojure.tools.cli :only [cli]])

(cli args
     ["-n" "--name" "The name" :e-fn #(Integer. %)] 
     ["-h" "--host" "The hostname" :default "localhost"]
     ["-v" "--[no-]verbose" :default true]
     ["-l" "--log-directory" :default "/some/path"])
(println (str "Hello, " (read-line)))
