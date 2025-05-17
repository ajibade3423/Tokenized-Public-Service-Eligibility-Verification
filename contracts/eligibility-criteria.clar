;; Eligibility Criteria Contract
;; Records service requirements

(define-data-var admin principal tx-sender)

;; Service data structure
(define-map services
  { service-id: (buff 32) }
  {
    name: (string-utf8 100),
    description: (string-utf8 256),
    min-age: uint,
    max-income: uint,
    required-docs: (list 10 (buff 32))
  }
)

;; Function to add a new service
(define-public (add-service
                (service-id (buff 32))
                (name (string-utf8 100))
                (description (string-utf8 256))
                (min-age uint)
                (max-income uint)
                (required-docs (list 10 (buff 32))))
  (begin
    (asserts! (is-eq tx-sender (var-get admin)) (err u1))
    (asserts! (is-none (map-get? services {service-id: service-id})) (err u2))

    (map-set services
      {service-id: service-id}
      {
        name: name,
        description: description,
        min-age: min-age,
        max-income: max-income,
        required-docs: required-docs
      }
    )
    (ok true)
  )
)

;; Function to update a service
(define-public (update-service
                (service-id (buff 32))
                (name (string-utf8 100))
                (description (string-utf8 256))
                (min-age uint)
                (max-income uint)
                (required-docs (list 10 (buff 32))))
  (begin
    (asserts! (is-eq tx-sender (var-get admin)) (err u3))
    (asserts! (is-some (map-get? services {service-id: service-id})) (err u4))

    (map-set services
      {service-id: service-id}
      {
        name: name,
        description: description,
        min-age: min-age,
        max-income: max-income,
        required-docs: required-docs
      }
    )
    (ok true)
  )
)

;; Function to get service details
(define-read-only (get-service (service-id (buff 32)))
  (map-get? services {service-id: service-id})
)

;; Function to check if a document is required for a service
(define-read-only (is-document-required (service-id (buff 32)) (doc-id (buff 32)))
  (match (map-get? services {service-id: service-id})
    service (is-some (index-of (get required-docs service) doc-id))
    false
  )
)

;; Function to transfer admin rights
(define-public (set-admin (new-admin principal))
  (begin
    (asserts! (is-eq tx-sender (var-get admin)) (err u5))
    (ok (var-set admin new-admin))
  )
)
