(defsystem "clir-theories"
  :description "Theories database for CAVI-ART Intermediate Representation"
  :version "0.9.0"
  :author "Santiago Saavedra <s.saavedra@fdi.ucm.es>"
  :licence "Apache2"
  :depends-on ()
  :components
  ((:module "base"
            :pathname ""
            :components
            ((:file "fetcher")
             (:file "loader" :depends-on ("fetcher"))
             (:static-file "defaultdb/arrays.clir")
             (:static-file "LICENSE")))
   (:module "defaultdb"
            :components
            ((:static-file "database.lisp")
             (:static-file "arrays.mlw")
             (:static-file "numbers.why")))))
