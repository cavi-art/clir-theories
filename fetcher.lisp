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


(defpackage :ir.vc.theories
  (:use :cl)
  (:export #:*enabled-theory-databases*)
  (:export #:enable-default-theory-db #:enable-theory-db #:disable-theory-db
           #:find-import-in-theory-db
           #:get-theory-directory))

(in-package :ir.vc.theories)

(defparameter *default-theory-databases* (list (string 'defaultdb)))
(defvar *theory-databases* (make-hash-table :test #'equal))
(defvar *enabled-theory-databases* *default-theory-databases*)

(defvar *theories-directory* (directory-namestring *load-pathname*))


(defmacro define-theory-db (&whole args &key name description compatibility modules &allow-other-keys)
  (declare (ignore description compatibility modules))
  (let ((gname (gensym "NAME")))
    `(let ((,gname (string ',name)))
       (setf (gethash ,gname *theory-databases*)
             ',(list*
                :directory (truename (directory-namestring *load-pathname*))
                (cdr args))))))

(defun enable-theory-db (db-name)
  (pushnew (string db-name) *enabled-theory-databases*))

(defun disable-theory-db (db-name)
  (delete (string db-name) *enabled-theory-databases*))

(defun get-theory-directory (theory-name)
  (getf (gethash (string theory-name) *theory-databases*)
        :directory))

(defun find-import-in-theory-db (pkg)
  (getf (find-if (lambda (module)
                   (string= (string (getf module :name))
                            (string pkg)))
                 (apply #'append
                        (mapcar (lambda (theory)
                                  (getf theory :modules))
                                (enabled-theories))))
        :import))

(defun enabled-theories ()
  (mapcar
   (lambda (theory-name)
     (gethash theory-name
              *theory-databases*))
   *enabled-theory-databases*))
