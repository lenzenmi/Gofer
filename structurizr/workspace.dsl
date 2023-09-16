workspace {

    model {
        user = person "User"
        driver = person "Driver"
        disputeManager = person "Dispute Manager"

        webApp = softwareSystem "Website" {
          user -> this "Uses"

          reactApp = container "SPA Web App" {
            technology "React.js"
            user -> this "Create Paid Pre-paid Order Order"
            user -> this "Mark Order Completed" 
            user -> this "View Order Status and Driver Location"
            user -> this "Log In"
          }

          importMaps = container "ImportMap Deployment" {
              technology "import map"
          }
         

          cdnProxy = container "Front Door" {
            technology "Azure Front Door"
            user -> this "Uses"
          }

          blobStore = container "blobStore" {
            technology "Azure Blob Storage"
            cdnProxy -> this "retrieves assets"
            reactApp -> this "stored by"
            importMaps -> this "stored by"
          }
        }

        driverApp = softwareSystem "Driver's Mobile Application" {
            driver -> this "Uses"
            mobileApp = container "Driver's App" {
                driver -> this "Browse Orders Near Current Location" 
                driver -> this "Accept Order"
                driver -> this "Uploads Receipt"
                driver -> this "Withdraws Funds"
                driver -> this "Log in"
            }
        }

        apim = softwareSystem "API Management" {
            cdnProxy -> this "Connects to"
            driverApp -> this "Connects to"
          }

      externalSSO = softwareSystem "SSO" {

      }


      backEnd = softwareSystem "BackEnd" {
          driverApp -> this "Connects To"
          webApp -> this "Connects To"
          paymentSystem = container "PaymentSystem" {
          paymentDb = component "Payment Db" {

          }

          paymentWorker = component "Payment Worker" {
            this -> paymentDb "Reads and Writes to"
          }

          paymentProvider = component "Payment Provider" {
            paymentWorker -> this "Process Payment"
            paymentWorker -> this "Refund Payment"
          }
        }

        orderSupportTool = container "Order Support Tool" {
            disputeManager -> this "Adjudicates Disputes"
          }
        
        
        userAccounts = container "User Account System" {
          auth = component "Auth Service" {
            technology "Node JS"
            apim -> this "Proxies Requests For"
            webApp -> this "Logs In"
            driverApp -> this "Logs In"
            this -> externalSSO "Authenticates With"
          }

          authDatabase = component "Database" {
                auth -> this "Reads from and writes to"
          }          
        }
      

          orderSystem = container "Order System" {
          webApp -> this "Interacts With"
          driverApp -> this "Interacts With"

          orderApi = component "Order Api" {
            apim -> this "Proxies Requests For"

            driverApp -> this "Update Location"
            driverApp -> this "Update Order Status"
            driverApp -> this "GET Orders Near Location"
            driverApp -> this "Accept Order"
            driverApp -> this "Uploads Receipt"
            driverApp -> this "Dispute Unpaid Delivery"
            driverApp -> this "Send Funds to Driver"

            webApp -> this "Create Paid Pre-paid Order Order"
            webApp -> this "Mark Order Completed"
            webApp -> this "View Order Status and Driver Location"

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
            orderSupportTool -> this "Reads and Writes To"
           }  

          orderWorker = component "Order Worker" {
            this -> orderDb "Cancel Expired Orders"
            this -> paymentWorker "Order Cancelled" "Kafka"
          }
        }

        
      }
    }

    views {
        systemLandscape "gofer" {
            include *
            exclude "driverApp -> backEnd"
            exclude "webApp -> backend"
            exclude externalSSO
            autoLayout lr
        }

        container driverApp {
            include *
            autoLayout lr
        }

        container webApp {
            include *
            exclude "user -> reactApp"
            autoLayout lr
        }

        container webApp {
            include user
            include reactApp
            autoLayout lr
        }

        container backEnd {
            include *
            exclude apim
            exclude externalSSO
            autoLayout lr
        }

        component orderSystem {
            include *
            exclude apim
            autoLayout lr
        }

        component userAccounts {
          include *
          exclude apim
          autoLayout lr
        }

        component paymentSystem {
          include *
          autoLayout lr
        }

        theme default
    }

}