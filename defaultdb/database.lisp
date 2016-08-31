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

(define-theory-db
  :name defaultdb
  :description "Generic Why3 Theories DB"
  :compatibility ((why3))

  :modules ((:name ir.int
                   :files ("numbers.why")
                   :import "numbers.IntegerImports"
                   :description "Integer theory for the prover")
            (:name ir.array
                   :files ("arrays.mlw")
                   :import "arrays.ArrayImports"
                   :description "Array theory for the prover")
            (:name ir.array.immutable
                   :files ("arrays.mlw")
                   :import "arrays.ImmutabilityHelpers"
                   :description "Array immutability aids for writing immutable arrays the CLIR")
            (:name lemmas.arrays ;; This is the VU-name on :uses
             :files ("arrays.mlw")
             :import "arrays.ArrayLemmas"
             :description "Several additional lemmas on Arrays")))


