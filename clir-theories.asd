(defsystem "clir-theories"
  :description "Theories database for CAVI-ART Intermediate Representation"
  :version "0.9.0"
  :author "Santiago Saavedra <s.saavedra@fdi.ucm.es>"
  :licence "Apache2"
  :depends-on ()
  :components ((:file "fetcher")
               (:file "loader" :depends-on ("fetcher"))
               (:static-file "LICENSE")))
