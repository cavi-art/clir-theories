;;; CAVIART-THEORYDB - A Theory Database for use in the CAVI-ART Project originally
;;; developed at GPD UCM.
;;;
;;; Copyright 2016 Santiago Saavedra López <s.saavedra@fdi.ucm.es>, Grupo de
;;; Programación Declarativa - Universidad Complutense de Marid
;;;
;;; Licensed under the Apache License, Version 2.0 (the "License");
;;; you may not use this file except in compliance with the License.
;;; You may obtain a copy of the License at
;;;
;;;   http://www.apache.org/licenses/LICENSE-2.0
;;;
;;; Unless required by applicable law or agreed to in writing, software
;;; distributed under the License is distributed on an "AS IS" BASIS,
;;; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;;; See the License for the specific language governing permissions and
;;; limitations under the License.

;;; Theories have to be loaded this way, so that the directories are
;;; correctly generated with the needed auxiliary files for the
;;; backend provers.

(in-package :ir.vc.theories)

(defmacro get-source-location ()
  "For this project to work with ASDF3, we need this to be a macro so
that its code gets executed at compile time, and thus saving in the
compiled FASL file the true location of the source lisp files, where
the defaultdb will sit as static-files."
  (or *compile-file-pathname* *load-truename*))

(load (merge-pathnames #P"./defaultdb/database.lisp"
                       (get-source-location)))
