workspace {

    model {
        user = person "User"
        driver = person "Driver"

        webApp = softwareSystem "Website" {
          reactApp = container "App and Assets" {
            technology "React.js"
          }

          importMaps = container "ImportMap Deployment" {
            technology "import map"
          }

          cdnAndFirewall = container "Front Door" {
            technology "Azure Front Door"
            user -> this "Uses"
          }

          blobStore = container "blobStore" {
            technology "Azure Blob Storage"
            cdnAndFirewall -> this "retrieves assets"
            reactApp -> this "stored by"
            importMaps -> this "stored by"
          }
        }

        driverApp = softwareSystem "Driver's Mobile Application" {
            mobileApp = container "Driver's App" {
                driver -> this "Uses"
                driver -> this "Browses Orders Near Current Location" 
                driver -> this "Accepts Orders"
                driver -> this "Uploads Receipt"
                driver -> this "Enter's Payment Information"
            }
        }

        backEnd = softwareSystem "BackEnd" {

        paymentSystem = container "PaymentSystem" {
          paymentDb = component "Payment Db" {}

          paymentWorker = component "Payment Worker" {
            this -> paymentDb "Reads and Writes to"
          }

          paymentProvider = component "Payment Provider" {
            paymentWorker -> this "Process Payment"
            paymentWorker -> this "Refund Payment"
          }
        }

        orderSystem = container "Order System" {
          webApp -> this "Interacts With"
          driverApp -> this "Interacts With"
          orderApi = component "Order Api" {
            driverApp -> this "Update Location"
            driverApp -> this "Update Order Status"
            driverApp -> this "Accept Order"
            driverApp -> this "Upload Receipt Image"
            driverApp -> this "Dispute Unpaid Delivery"

            webApp -> this "Create Paid Pre-paid Order Order"
            webApp -> this "Mark Order Completed"
            webApp -> this "View Order Status"

            this -> paymentSystem "Payment Token To Process" "Kafka"
            this -> paymentWorker "Order Cancelled Release Payment" "Kafka"
            paymentWorker -> this "Payment Processed" "Kafka"
          }

          orderBlob = component "Order Blob Store" {
            orderApi -> this "Save Driver Submitted Receipt Images"
          }

          orderDb = component "Order Database" {
            orderApi -> this "Read and Write Order Status and Driver Location"
            orderApi -> this "Logs Driver Location Updates for Order"
           }  
        }
        
        userAccounts = container "User Account System" {
          auth = component "Auth Service" {
            technology "Node JS"
            webApp -> this "Logs In"
            driverApp -> this "Logs In"
          }

          authDatabase = component "Database" {
                auth -> this "Reads from and writes to"
          }

          identityVerification = component "Identity Verification" { 
            auth -> this "Validate Identity"
          }

          driverApp -> this "Validate Identity"
          
        }
      }
    }

    views {
        systemLandscape "gofer" {
            include *
        }

        container driverApp {
            include *
            autoLayout lr
        }

        container webApp {
            include *
            autoLayout lr
        }

        container backEnd {
            include *
            autoLayout lr
        }

        component orderSystem {
            include *
            autoLayout lr
        }

        component userAccounts {
          include *
          autoLayout lr
        }

        component paymentSystem {
          include *
          autoLayout lr
        }

        theme default
    }

}