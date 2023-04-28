library(shiny)
library(shinydashboard)
library(rsconnect)
library(shinyjs)
library(stringr)

KB75601 <- "https://iaas.service-now.com/nav_to.do?uri=%2Fkb_view_customer.do%3Fsys_kb_id%3D3309f9a80fe17a4047c64d8ce1050e08%26sysparm_language%3D%26sysparm_nameofstack%3D%26sysparm_kb_search_table%3D%26sysparm_tasksearch_company%3D%26sysparm_search%3DKB75601%26sysparm_extcall%3D%26sysparm_extreference%3D%26sysparm_extsubsystem%3D%26sysparm_cms%3D%26sysparm_u_channel%3Dnull%26sysparm_topic%3D%26sysparm_category%3D%26sysparm_search_method%3Dservicenow"
KB99874 <- "https://iaas.service-now.com/nav_to.do?uri=%2Fkb_view_customer.do%3Fsys_kb_id%3D1247a29adb58ab80878e71fb8c961905%26sysparm_language%3D%26sysparm_nameofstack%3D%26sysparm_kb_search_table%3D%26sysparm_tasksearch_company%3D%26sysparm_search%3DKB99874%26sysparm_extcall%3D%26sysparm_extreference%3D%26sysparm_extsubsystem%3D%26sysparm_cms%3D%26sysparm_u_channel%3Dnull%26sysparm_topic%3D%26sysparm_category%3D%26sysparm_search_method%3Dservicenow"
KB124759 <- "https://iaas.service-now.com/nav_to.do?uri=%2Fkb_view_customer.do%3Fsys_kb_id%3D797c4756db70e4d02acbae27489619a3%26sysparm_language%3D%26sysparm_nameofstack%3D%26sysparm_kb_search_table%3D%26sysparm_tasksearch_company%3D%26sysparm_search%3DKB124759%26sysparm_extcall%3D%26sysparm_extreference%3D%26sysparm_extsubsystem%3D%26sysparm_cms%3D%26sysparm_u_channel%3Dnull%26sysparm_topic%3D%26sysparm_category%3D%26sysparm_search_method%3Dservicenow"
KB123793 <- "https://iaas.service-now.com/nav_to.do?uri=%2Fkb_view_customer.do%3Fsys_kb_id%3D685074b81be35050769810a41a4bcb72%26sysparm_language%3D%26sysparm_nameofstack%3D%26sysparm_kb_search_table%3D%26sysparm_tasksearch_company%3D%26sysparm_search%3DKB123793%26sysparm_extcall%3D%26sysparm_extreference%3D%26sysparm_extsubsystem%3D%26sysparm_cms%3D%26sysparm_u_channel%3Dnull%26sysparm_topic%3D%26sysparm_category%3D%26sysparm_search_method%3Dservicenow"
KB124564 <- "https://iaas.service-now.com/nav_to.do?uri=%2Fkb_view_customer.do%3Fsys_kb_id%3Dd43ca4e4db2c2050ce9cae2748961955%26sysparm_language%3D%26sysparm_nameofstack%3D%26sysparm_kb_search_table%3D%26sysparm_tasksearch_company%3D%26sysparm_search%3DKB124564%26sysparm_extcall%3D%26sysparm_extreference%3D%26sysparm_extsubsystem%3D%26sysparm_cms%3D%26sysparm_u_channel%3Dnull%26sysparm_topic%3D%26sysparm_category%3D%26sysparm_search_method%3Dservicenow"
KB75919 <- "https://iaas.service-now.com/nav_to.do?uri=%2Fkb_view_customer.do%3Fsys_kb_id%3D4c31e6c90fb5f2443c674d8ce1050e67%26sysparm_language%3D%26sysparm_nameofstack%3D%26sysparm_kb_search_table%3D%26sysparm_tasksearch_company%3D%26sysparm_search%3DKB100608%26sysparm_extcall%3D%26sysparm_extreference%3D%26sysparm_extsubsystem%3D%26sysparm_cms%3D%26sysparm_u_channel%3Dnull%26sysparm_topic%3D%26sysparm_category%3D%26sysparm_search_method%3Dservicenow"
#Airwatch KB's
KB81321 <- "https://iaas.service-now.com/nav_to.do?uri=%2Fkb_view_customer.do%3Fsys_kb_id%3D6fd8e2370f1cc78095d34d8ce1050e09%26sysparm_language%3D%26sysparm_nameofstack%3D%26sysparm_kb_search_table%3D%26sysparm_tasksearch_company%3D%26sysparm_search%3Dairwatch%26sysparm_extcall%3D%26sysparm_extreference%3D%26sysparm_extsubsystem%3D%26sysparm_cms%3D%26sysparm_u_channel%3Dnull%26sysparm_topic%3D%26sysparm_category%3D%26sysparm_search_method%3Dservicenow"
KB66648 <- "https://iaas.service-now.com/nav_to.do?uri=%2Fkb_view_customer.do%3Fsys_kb_id%3D5034ecc20f4caa002ba7ed1be1050eee%26sysparm_language%3D%26sysparm_nameofstack%3D%26sysparm_kb_search_table%3D%26sysparm_tasksearch_company%3D%26sysparm_search%3Dairwatch%26sysparm_extcall%3D%26sysparm_extreference%3D%26sysparm_extsubsystem%3D%26sysparm_cms%3D%26sysparm_u_channel%3Dnull%26sysparm_topic%3D%26sysparm_category%3D%26sysparm_search_method%3Dservicenow"
KB68274 <- "https://iaas.service-now.com/nav_to.do?uri=%2Fkb_view_customer.do%3Fsys_kb_id%3D02e29d950f11ee408d7b384be1050e74%26sysparm_language%3D%26sysparm_nameofstack%3D%26sysparm_kb_search_table%3D%26sysparm_tasksearch_company%3D%26sysparm_search%3Dairwatch%26sysparm_extcall%3D%26sysparm_extreference%3D%26sysparm_extsubsystem%3D%26sysparm_cms%3D%26sysparm_u_channel%3Dnull%26sysparm_topic%3D%26sysparm_category%3D%26sysparm_search_method%3Dservicenow"
KB105347 <- "https://iaas.service-now.com/nav_to.do?uri=%2Fkb_view_customer.do%3Fsys_kb_id%3D4025f3c2db2b2b80843a71fb8c96197a%26sysparm_language%3D%26sysparm_nameofstack%3D%26sysparm_kb_search_table%3D%26sysparm_tasksearch_company%3D%26sysparm_search%3Dairwatch%26sysparm_extcall%3D%26sysparm_extreference%3D%26sysparm_extsubsystem%3D%26sysparm_cms%3D%26sysparm_u_channel%3Dnull%26sysparm_topic%3D%26sysparm_category%3D%26sysparm_search_method%3Dservicenow"
KB73780 <- "https://iaas.service-now.com/nav_to.do?uri=%2Fkb_view_customer.do%3Fsys_kb_id%3Dbee72aa10fb8f240ea99335be1050eca%26sysparm_language%3D%26sysparm_nameofstack%3D%26sysparm_kb_search_table%3D%26sysparm_tasksearch_company%3D%26sysparm_search%3Dairwatch%26sysparm_extcall%3D%26sysparm_extreference%3D%26sysparm_extsubsystem%3D%26sysparm_cms%3D%26sysparm_u_channel%3Dnull%26sysparm_topic%3D%26sysparm_category%3D%26sysparm_search_method%3Dservicenow"
KB111555 <- "https://iaas.service-now.com/nav_to.do?uri=%2Fkb_view_customer.do%3Fsys_kb_id%3D73ac3a37db81f3c89e8771598c96199f%26sysparm_language%3D%26sysparm_nameofstack%3D%26sysparm_kb_search_table%3D%26sysparm_tasksearch_company%3D%26sysparm_search%3Dairwatch%26sysparm_extcall%3D%26sysparm_extreference%3D%26sysparm_extsubsystem%3D%26sysparm_cms%3D%26sysparm_u_channel%3Dnull%26sysparm_topic%3D%26sysparm_category%3D%26sysparm_search_method%3Dservicenow"
KB67998  <- "https://iaas.service-now.com/nav_to.do?uri=%2Fkb_view_customer.do%3Fsys_kb_id%3D9a0d53d12bc1aa00725b016be8da1504%26sysparm_language%3D%26sysparm_nameofstack%3D%26sysparm_kb_search_table%3D%26sysparm_tasksearch_company%3D%26sysparm_search%3Dairwatch%26sysparm_extcall%3D%26sysparm_extreference%3D%26sysparm_extsubsystem%3D%26sysparm_cms%3D%26sysparm_u_channel%3Dnull%26sysparm_topic%3D%26sysparm_category%3D%26sysparm_search_method%3Dservicenow"
#DB KB'S
KB66793 <- "https://iaas.service-now.com/nav_to.do?uri=%2Fkb_view_customer.do%3Fsys_kb_id%3D1f872deb0fc86604694a384be1050ebe%26sysparm_language%3D%26sysparm_nameofstack%3D%26sysparm_kb_search_table%3D%26sysparm_tasksearch_company%3D%26sysparm_search%3DKB66793%26sysparm_extcall%3D%26sysparm_extreference%3D%26sysparm_extsubsystem%3D%26sysparm_cms%3D%26sysparm_u_channel%3Dnull%26sysparm_topic%3D%26sysparm_category%3D%26sysparm_search_method%3Dservicenow"
KB74943 <- "https://iaas.service-now.com/nav_to.do?uri=%2Fkb_view_customer.do%3Fsysparm_article%3DKB74943"
#AD
KB67360 <- "https://iaas.service-now.com/nav_to.do?uri=%2Fkb_view_customer.do%3Fsys_kb_id%3Dcac7617d0f64a24012c8384be1050e8f%26sysparm_language%3D%26sysparm_nameofstack%3D%26sysparm_kb_search_table%3D%26sysparm_tasksearch_company%3D%26sysparm_search%3Dpassword%20reset%26sysparm_extcall%3D%26sysparm_extreference%3D%26sysparm_extsubsystem%3D%26sysparm_cms%3D%26sysparm_u_channel%3Dnull%26sysparm_topic%3D%26sysparm_category%3D%26sysparm_search_method%3Dservicenow"
#DLC KB
KB67355  <- "https://iaas.service-now.com/nav_to.do?uri=%2Fkb_view_customer.do%3Fsys_kb_id%3Db8b1edf90f64a24012c8384be1050e34%26sysparm_language%3D%26sysparm_nameofstack%3D%26sysparm_kb_search_table%3D%26sysparm_tasksearch_company%3D%26sysparm_search%3Ddlc%26sysparm_extcall%3D%26sysparm_extreference%3D%26sysparm_extsubsystem%3D%26sysparm_cms%3D%26sysparm_u_channel%3Dnull%26sysparm_topic%3D%26sysparm_category%3D%26sysparm_search_method%3Dservicenow"
#Polling KB
KB100220 <- "https://iaas.service-now.com/nav_to.do?uri=%2Fkb_view_customer.do%3Fsys_kb_id%3Deebe15efdba8e3c456347dbb8c96195b%26sysparm_language%3D%26sysparm_nameofstack%3D%26sysparm_kb_search_table%3D%26sysparm_tasksearch_company%3D%26sysparm_search%3DNot%20polled%26sysparm_extcall%3D%26sysparm_extreference%3D%26sysparm_extsubsystem%3D%26sysparm_cms%3D%26sysparm_u_channel%3Dnull%26sysparm_topic%3D%26sysparm_category%3D%26sysparm_search_method%3Dservicenow"
#L1 triage
KB67070 <- "https://iaas.service-now.com/nav_to.do?uri=%2Fkb_view_customer.do%3Fsys_kb_id%3D5bb260e32bd86a003a6c35a119da15b0%26sysparm_language%3D%26sysparm_nameofstack%3D%26sysparm_kb_search_table%3D%26sysparm_tasksearch_company%3D%26sysparm_search%3Dl1%20triage%26sysparm_extcall%3D%26sysparm_extreference%3D%26sysparm_extsubsystem%3D%26sysparm_cms%3D%26sysparm_u_channel%3DGameStop%26sysparm_topic%3D%26sysparm_category%3D%26sysparm_search_method%3Dservicenow"
#C2S
KB71907 <- "https://iaas.service-now.com/nav_to.do?uri=%2Fkb_view_customer.do%3Fsys_kb_id%3D68fa114f0f003ac0099d1e0be1050e15%26sysparm_language%3D%26sysparm_nameofstack%3D%26sysparm_kb_search_table%3D%26sysparm_tasksearch_company%3D%26sysparm_search%3Dc2s%26sysparm_extcall%3D%26sysparm_extreference%3D%26sysparm_extsubsystem%3D%26sysparm_cms%3D%26sysparm_u_channel%3Dnull%26sysparm_topic%3D%26sysparm_category%3D%26sysparm_search_method%3Dservicenow"

Orders <- "https://source.compucom.com/products/"
Airwatch <- "https://gamestopadmin.awmdm.com/AirWatch/Login?ReturnUrl=%2FAirWatch%2F"
Citrix <- "https://myaccess.gamestop.com/logon/LogonPoint/tmindex.html"
trackit <- "https://trackit.compucom.com/gamestop/HelpDesk"
SNOW <- "https://iaas.service-now.com/nav_to.do?uri=%2Fincident.do%3Fsys_id%3D-1%26sysparm_stack%3Dincident_list.do"


gamestop <- tags$img(src = "GSLL.png",
                     height = '30', width = '170')




ui <- 

  fluidPage(
  tabsetPanel(
    
    # > Login -------
    
    tabPanel("Login",
             value = 1,
             br(),
             h3("Input your credentials to have access to GS information"),br(),
             textInput("username", "Username"),
             passwordInput("password", label = "Password"),
             actionButton("login", "Login"),
             br(),
             br(),
             
             
    ), # closes tabPanel
    
    id = "tabselected", type = "tabs"
    
  )  # closes tabsetPanel      
)

  
  
  GSGUI <- dashboardPage(skin = "yellow",
                    
                    
                    
                    dashboardHeader(title = gamestop,
                                    
                                    dropdownMenu(type = "tasks",
                                                 messageItem(
                                                     from = "My contact",
                                                     message = "Raul.ble@compucom.com",
                                                     icon = icon("glyphicon glyphicon-envelope"),
                                                     href = "mailto:raul.ble@compucom.com"),
                                                 icon = icon("envelope")
                                    )
                                    
                    ),
                    
                    
                    
                    dashboardSidebar( 
                        sidebarMenu(
                            menuItem("Main menu", tabName = "main_menu", icon = icon("home")),
                            menuItem("Peripherals", tabName = "peripherals", icon = icon("hdd")),
                            menuItem("Database repair", tabName = "widgets", icon = icon("th"), badgeLabel = "Completed",
                                     badgeColor = "green"),
                            menuItem("Polling", tabName = "polling", icon = icon("cloud"), badgeLabel = "Completed",
                                     badgeColor = "green"),
                            menuItem("Surface", tabName = "surface", icon = icon("microsoft"),  badgeLabel = "Completed",
                                     badgeColor = "green"),
                            menuItem("Surface Service Desk", tabName = "surfacesd", icon = icon("windows"),  badgeLabel = "TS added",
                                     badgeColor = "yellow"),
                            menuItem("Fort", tabName = "fort", icon = icon("arrows-alt-h"), badgeLabel = "Completed",
                                     badgeColor = "green"),
                            menuItem("Point of sale", tabName = "point_of_sale", icon = icon("hand-holding-usd")),
                            menuItem("Store network", tabName = "store_network", icon = icon("network-wired"),  badgeLabel = "Completed",
                                     badgeColor = "green"),
                            menuItem("Our apps", tabName = "our_apps", icon = icon("desktop"), badgeLabel = "Completed",
                                     badgeColor = "green")
                            
                            
                        )
                    ),
                    
                    
                    dashboardBody(tags$head(
                        tags$link(rel = "stylesheet", type = "text/css", href = "Custom.css")),
                        
                        
                        
                        fluidPage(
                            tabItems(
                                
                                tabItem(tabName = "widgets",
                                        img(
                                            src = "https://upload.wikimedia.org/wikipedia/commons/d/d0/RStudio_logo_flat.svg", 
                                            height = 45, width = 50, align ="right"),
                                        h1("Database repair"),
                                        h3("Disclaimer"),
                                        strong("1.-This is only an aid for your database repair, you still are obligated to use"), strong(tags$a(href = KB66793, style = "color:green", "KB66793" )),
                                        strong("and"),strong(tags$a(href = KB74943, style ="color:green", "KB74943." )),br(),
                                        br(),
                                        strong("2.- Read all the document before using it. I tried to detail the process as much as possible, 
                                                so the explanation could be clear enough for all of us. "),br(),
                                        br(),
                                        strong("3.-If you have any questions, or you think we can improve this document, 
                                                please let me know for us to modify it accordingly."),br(),
                                        br(),
                                        strong("4.- If the corrupted Database is"),
                                        strong("PRESELL.MDB", style = "color:red"),
                                        strong("you have to go to the manual repair KB and tab to fix the database issue."),br(),
                                        strong("Dismissing this disclaimer will cause the store reservations to be lost so please
                               make sure to repair it manually."),br(),
                                        br(),
                                        
                                        tabsetPanel(type = "tabs",
                                                    
                                                    tabPanel("Glossary",
                                                             h1("Glossary"),
                                                             strong("1.-Database - A database is an organized collection of structured information, or data."),br(),
                                                             br(),
                                                             strong("2.- .MDB - (Microsoft Access data base)"),br(),
                                                             strong("The Microsoft database is where all the information about that DB is for example:"),br(),
                                                             strong("Presell.MDB - this database has all the pre orders of the store (Previous to sell)"),br(),
                                                             strong("ITEM.MDB - this DB contains all the inventory of the store"),br(),
                                                             br(),
                                                             strong("3.- .LDB - Locked database "),br(),
                                                             strong("The locked databases are basically what the name implies, 
                                                       it is a lock that does not allow someone out of the system to mess with the database."),br(),
                                                             strong("The size of a locked database is 1KB (basically nothing)
                                                       but it does not allow you to alter the code or the contents of the database "),br(),
                                                             br(),
                                                             strong("4.- MDB repair utility"),br(),
                                                             strong("This is our first line of defense against database corruption."),br(),
                                                             strong("You can access this via: Restricted utilities - option 2 - option D (repair databases)")
                                                    ),                       #Final tab glossary 
                                                    
                                                    
                                                    
                                                    tabPanel("Musts",
                                                             h1("The 4 must of a database repair"),
                                                             strong("You must perform this every time you have a database repair"),br(),
                                                             br(),
                                                             strong("1.- You must turn off all the auxiliary registers"),br(),
                                                             strong("Do not believe the user if he tells you that he turned them off 
                                                - you must check if the registers are not pinging anymore on STS."),br(),
                                                             br(),
                                                             strong("2.- You must close R1 re tech (Alt+F4) 
                                                & POS (Ctrl+shift+z), until it is on the property of GameStop black screen."),br(),
                                                             br(),
                                                             strong("3.- You need to put the register on a clean boot and 
                                                restart the register so there are no hangingprograms that can mess up your DB repair.
                                                (on RU - Opt 4 - Boot system clean/normal)"),br(),
                                                             strong("The normal text is what the register is set to at the moment in the case of image 1 the register is on 
                                                a normal boot so we would have to change it to a clean boot to start the process."),br(),
                                                             br(),
                                                             fluidPage(width = 6, img(src = "normalboot1.png", 
                                                                                      width = "50%", align ="center")),
                                                             br(),
                                                             strong("4.- Record the date and time stamp of ALL BAK_1, BAK_2, BAK_3 into the incident ticket by either copying the image of the 
                                                information or manually typing the information in the NOTES Tab. The Bak folder is on c:\\bak - If the times
                                                are incorrect for more than 1 week please contact a team lead because the DB backup should be performed 
                                                every 2 hours and daily."),
                                                             br(),
                                                             br(),
                                                             fluidPage(img(src = "bak.png", 
                                                                           height = 175, width = 400, align ="left")),
                                                             br(),
                                                             fluidPage(img(src = "bakdate.png", 
                                                                           height = 175, width = 400, align ="left")),
                                                    ), 
                                                    
                                                    
                                                    tabPanel("DB repair",
                                                             h1("Database repair process"),br(),
                                                             strong("After you performed the 4 must of the DB repair you can start the database repair process
                                         open restricted utilities - option 2 - repair databases (option D) "),br(),
                                                             strong("That will open the following"),br(),
                                                             br(),
                                                             fluidPage(img(src = "MDB.png", 
                                                                           height = 400, width = 400, align ="left")),
                                                             br(),
                                                             strong("Select the option all databases (highlighted in blue) and click repair."),br(),
                                                             strong("This option has basically 3 outcomes: "),br(),
                                                             br(),
                                                             strong('1.- Locked databases: '),br(),
                                                             strong("This outcome happens 9/10 times, this is because the databases are almost always 
                                                locked (explained on the glossary)"),br(),
                                                             br(),
                                                             strong("2.- Repair unsuccessful: "),br(),
                                                             strong("This happens when the database was actually corrupted, and the automatic repair program failed to repair it."),br(),
                                                             br(),
                                                             strong("3.- Repair successful: "),br(),
                                                             strong("This is when your first line of defense (MDB repair utility) is victorious and achieves to repair all the databases.")
                                                    ),
                                                    
                                                    
                                                    
                                                    tabPanel("Locked DB",
                                                             h1("Locked databases"),
                                                             strong("This is the pop up for the locked databases"),br(),
                                                             br(),
                                                             fluidPage(img(src = "LDB.png",
                                                                           height = 400, width = 500, align ="left")),
                                                             br(),
                                                             strong("To delete the locked databases you have to open a command 
                                                prompt either with the ibm remote tool or with RU."),br(),
                                                             strong("Then open and admin command prompt with runas /u:possvrsvc cmd Password: p0$$vr$vc"),br(),
                                                             br(),
                                                             fluidPage(img(src = "cmd2.png",
                                                                           height = 50, width = 200, align ="left")),
                                                             br(),
                                                             strong("Once you open the prompt you have to input the CD command and the folder where the DB is located."),br(),
                                                             strong("CD: This command means Change Directory; this makes the command prompt to change the directory where 
                                                it is sending all the inputs.", style = "color:#15942B"),br(),
                                                             strong("input: CD c:/pos - This will take you to the directory where the file is located"),br(),
                                                             br(),
                                                             fluidPage(img(src = "cmd3.png",
                                                                           height = 100, width = 500, align ="left")),
                                                             br(),
                                                             strong("Now you can delete the .LDB file"),br(),
                                                             h2("NEVER ERASE AN .MDB FILE.", style = "color:red" ),
                                                             h3("THIS WILL DELETE THE DB COMPLETELY FROM THE SYSTEM AND YOU WILL 
                                            HAVE TO CONTACT GV SO THEY CAN UPLOAD IT FROM AN ESPECIFIC FOLDER THEY ONLY HAVE ACCESS TO.", style = "color:red"),br(),
                                                             br(),
                                                             strong("For example: if the DB c:\\pos\\logs\\poslogs.MDB is corrupted you have to input:"),br(),
                                                             strong("CD c:\\pos\\logs <ENTER>"), br(),
                                                             strong("Del poslogs.LDB"),br(),
                                                             br(),
                                                             strong("And done, this will delete the Locked database and you can continue with the repair "),br(),
                                                             strong("You have to repeat this with all the locked databases that appear in the MDB repair utility."),br(),
                                                             strong("If you cannot erase an LDB file with the command prompt contact a team lead or a mentor so they can erase the file manually."),br(),
                                                             br(),
                                                             strong("When all the LDB files are erased now you can go to the repair utility and press repair again."),br(),
                                                             strong("This will have two outcomes:"),br(),
                                                             br(),
                                                             strong("1.- Successful Repair - You are done, you can run booter and open the register"),br(),
                                                             br(),
                                                             strong("2.- Unsuccessful repair - See tab 'Unsuccessful repair'")
                                                    ),
                                                    
                                                    
                                                    tabPanel("Unsuccessful repair",
                                                             h1("Unsuccessful repair"),
                                                             strong("After the deletion of the .LDB files has been performed you may get this error message"),br(),
                                                             br(),
                                                             fluidPage(img(src = "error1.png",
                                                                           height = 165, width = 500, align ="left")),
                                                             br(),
                                                             strong("You can click no on that message since the log is not important for us"),br(),
                                                             br(),
                                                             fluidPage(box(width = 8 ,img(src = "presell1.png",
                                                                                          height = "100%", width = "100%", align ="center"))),
                                                             br(),
                                                             strong("When you get this unsuccessful repair, you have to access a toll called fort11 /x via the command prompt."),br(),
                                                             br(),
                                                             strong("1.- Open the command prompt and input CD c:\\pos\\tools <Enter>"),br(),
                                                             strong("You now should be on the c:\\pos\\tools directory"),br(),
                                                             strong("Now input fort11 /X <Enter>"),br(),
                                                             strong("On that aplication you have to select Bak_1.zip"),br(),
                                                             strong("After that the following will appear:"),br(),
                                                             br(),
                                                             fluidPage(img(src = "fort1.png",
                                                                           height = 300, width = 500, align ="left")),
                                                             br(),
                                                             strong("Select the database that is corrupted and press R to restore, 
                                                basically what this does is taking the database from the pos folder and replace it
                                                with the one on bak_1.zip."),br(),
                                                             br(),
                                                             strong("Click yes & ok on the pop ups to restore the DB"),
                                                             strong("Go to RU once more and click repair ", strong(style = "color:green", "(normally the database will be locked, just erase the LDB file)"), 
                                                                    "this will have 2 outcomes:"), br(),
                                                             br(),
                                                             strong("1.- Successful repair - You are done and can run booter to open the register "),br(),
                                                             br(),
                                                             strong("2.- Unsuccessful repair - You will have to perform a manual repair"),
                                                             strong("KB74943", style = "color:black"),br(),
                                                             strong("If you are in this case go to the next tab")
                                                    ),
                                                    
                                                    
                                                    
                                                    tabPanel("Manual repair",
                                                             h1("Manual DB repair"),
                                                             strong("This KB (KB74943) is basically perfect and self-explanatory, I will only list some tips to have in mind in 
                                                this. This is the last step before escalating to GV."),
                                                             strong("To make a manual repair you have to access the Citrix desktop."),br(),
                                                             br(),
                                                             strong("Enter the C folder of R1 via windows explorer"),br(),
                                                             strong("You MUST use the user: possvrsvc and passcode: p0$$vr$vc to have admin rights ", 
                                                                    style = "color:green"),
                                                             strong("Once in access the POS folder and look for your database in question"),br(),
                                                             br(),
                                                             strong("You may have 2 files with the same name but different symbols. As previously mentioned, there is a 
                                                locked database and a Microsoft database, to make any change you have to delete the LDB file manually 
                                                (this is the 1KB file)."),
                                                             strong("Once you finish with the repair on Microsoft access (automatic repair) you have to drag the new 
                                                database into the POS c file."),br(),
                                                             br(),
                                                             strong("Go again to the register and run a repair as normal with the MDB repair utility "),br(),
                                                             strong("If the repair is still unsuccessful contact a mentor or a team lead")
                                                    ),
                                                    
                                                    
                                                    
                                                    tabPanel("Success!!",
                                                             h1("You made it!!!"),
                                                             strong("Congratulations, you fully repaired a database and can open the register"),br(),
                                                             strong("This is how a repaired DB will look like"),br(),
                                                             br(),
                                                             fluidPage(img(src = "mdbr.png",
                                                                           height = 500, width = 500, align ="left")),
                                                             br(),
                                                             strong("Remember to return the register back to normal boot onRU - Opt 4 - Boot system clean/normal"),br(),
                                                             br(),
                                                             fluidPage(img(src = "normalboot1.png", 
                                                                           height = 110, width = 400, align ="left")),
                                                             br(),
                                                             strong("Thanks for reading this DB resolution, remember if you have a question please contact me")
                                                             
                                                    ),
                                                    
                                                    tabPanel("Summary",
                                                             h1("Summary"),
                                                             strong("Here I will input a quick summary to repair the DB"),br(),
                                                             strong("1.- shut down all aux. registers, put R1 in clean boot and restart it"),br(),
                                                             strong("2.- Open reapir database and erase all the .LDB files"),br(),
                                                             strong("3.- Click on repair if is successful run booter if not open the fort11 repair tool with 
                                                c:\\pos\\tools\\fort11"),br(),
                                                             strong("4.- Restore the corrupted database")
                                                    )
                                                    
                                        )
                                ), #Final tab Widgets
                                
                                
                                
                                tabItem(tabName = "peripherals",
                                        img(
                                            src = "https://upload.wikimedia.org/wikipedia/commons/d/d0/RStudio_logo_flat.svg", 
                                            height = 45, width = 50, align ="right"),
                                        h1("Peripherals"),
                                        h3(strong("Disclaimer")),
                                        strong("This is only an aid for your peripheral repair you still have to use the correspondant 
                KB to fix them"),br(),
                                        br(),
                                        
                                        tabsetPanel(
                                            type = "tabs",
                                            tabPanel("Report printers",br(),
                                                     
                                                     tabsetPanel(id = "firsttabset",
                                                                 type = "tabs",
                                                                 tabPanel("M452DW",br(),
                                                                          fluidPage(img(src = "M452DW.png", 
                                                                                        height = 150, width = 200, align ="left")),br(),
                                                                          tabsetPanel(type = "tabs",
                                                                                      tabPanel("Not pinging",br(),
                                                                                               "This printer has 3 types of connections, to verify which one is on your printer just ask the user
                                                                         *How many cables are connected to your printer.* ",br(),
                                                                                               br(),
                                                                                               
                                                                                               tabsetPanel(type = "tab",
                                                                                                           
                                                                                                           tabPanel("Ethernet",br(),
                                                                                                                    strong(tags$a(href = KB99874,
                                                                                                                                  style = "color:Green" ,"KB99874"),"<- Source"),br(),
                                                                                                                    br(),
                                                                                                                    "If the printer is connected via ethernet you have to follow this steps:",br(),
                                                                                                                    br(),
                                                                                                                    "1.- Check if the printer is connected to port 13 or 14 on the switch",br(),
                                                                                                                    "If it is connected to a patch panel follow the networking page",br(),
                                                                                                                    br(),
                                                                                                                    "2.- Tell the user to enter on the printer to setup - Network setup - 
                                                                                                    passcode: pr1n73r - IPV4 config - Manual - ask the user for the IP",br(),
                                                                                                                    "The setting should be :",br(),
                                                                                                                    br(),
                                                                                                                    "< IP: store IP .034 (for a second printer it would be store IP .035>",br(),
                                                                                                                    "< Subnet: 255.255.255.224>",br(),
                                                                                                                    "< Gateway: store IP .033>",br(),
                                                                                                                    strong("Note: The ip should be written with 3 numbers on each space ex: 010.003.045.034"),br(),
                                                                                                                    br(),
                                                                                                                    "3.- Check if the printer is pinging now, if it is you finished, if it is not continue to step 4",br(),
                                                                                                                    br(),
                                                                                                                    "4.- Look at the IPV4 settings once more - if the printer IP is on 000.000.000.000, 
                                                                                                    try connecting the printer via Wi-Fi",br(),
                                                                                                                    br(),
                                                                                                                    "5.- If the printer is still on 0's, you can connect it via USB (USB tab) or install the printers certificates"
                                                                                                                    
                                                                                                                    
                                                                                                           ),
                                                                                                           
                                                                                                           
                                                                                                           tabPanel("Wi-Fi",br(),
                                                                                                                    
                                                                                                                    strong(tags$a(href = KB75601,
                                                                                                                                  style = "color:green", "KB75601"),"<- Source"),br(),
                                                                                                                    br(),
                                                                                                                    
                                                                                                                    "If the printer is connected via Wi-Fi you have to follow this steps:",br(),
                                                                                                                    br(),
                                                                                                                    "1.- On the printer go to Setup - Network setup - passcode: pr1n73r
                                                                                                     - Wireless menu - Wireless setup wizard - and select GSSM. If it says conection
                                                                                                     stablished check if the printer is printing, if it says unsuccessful connection 
                                                                                                     check if the Wireless access point (WAP) is pinging",br(),
                                                                                                                    br(),
                                                                                                                    "2.- If the WAP is not pinging TS it for the printer to connect to GSSM, if it is go to step 3",br(),
                                                                                                                    br(),
                                                                                                                    "3.- Tell the user to enter on the printer to setup - Network setup - 
                                                                                                    passcode: pr1n73r - IPV4 config - Manual - ask the user for the IP",br(),
                                                                                                                    "The setting should be :",br(),
                                                                                                                    br(),
                                                                                                                    "< IP: store IP .034 (for a second printer it would be store IP .035>",br(),
                                                                                                                    "< Subnet: 255.255.255.224>",br(),
                                                                                                                    "< Gateway: store IP .033>",br(),
                                                                                                                    strong("Note: The ip should be written with 3 numbers on each space ex: 010.003.045.034"),br(),
                                                                                                                    br(),
                                                                                                                    "4.- Check if the printer is pinging now, if it is you finished, if it is not continue to step 5",br(),
                                                                                                                    br(),
                                                                                                                    "5.- Look at the IPV4 settings once more - if the printer IP is on 000.000.000.000, 
                                                                                                    try connecting the printer via Ethernet",br(),
                                                                                                                    br(),
                                                                                                                    "6.- If the printer is still on 0's, you can connect it via USB (USB tab) or install the printer certificates"
                                                                                                                    
                                                                                                           ),
                                                                                                           
                                                                                                           tabPanel("USB",br(),
                                                                                                                    "USB connected printers should not ping,
                                                                                                if the printer is connected via USB go to the USB is not printing tab")
                                                                                               )
                                                                                      ),
                                                                                      
                                                                                      
                                                                                      
                                                                                      
                                                                                      
                                                                                      
                                                                                      tabPanel("USB not printing",br(),
                                                                                               strong(tags$a(href = "https://iaas.service-now.com/nav_to.do?uri=%2Fkb_view_customer.do%3Fsys_kb_id%3Dc4ef9e1d0f9d7a0047c64d8ce1050e3e%26sysparm_language%3D%26sysparm_nameofstack%3D%26sysparm_kb_search_table%3D%26sysparm_tasksearch_company%3D%26sysparm_search%3DKB75361%26sysparm_extcall%3D%26sysparm_extreference%3D%26sysparm_extsubsystem%3D%26sysparm_cms%3D%26sysparm_u_channel%3Dnull%26sysparm_topic%3D%26sysparm_category%3D%26sysparm_search_method%3Dservicenow"
                                                                                                             ,style = "Color:Green", "KB75361"), "<- Source"),br(),
                                                                                               br(),
                                                                                               "The printer uses USB A to USB B",br(),
                                                                                               br(),
                                                                                               fluidPage(img(src = "USBB.png", 
                                                                                                             height = 150, width = 200, align ="left")),br(),
                                                                                               "The printer has to be connected on the back of the register (the motherboard)",br(),
                                                                                               "Once connected you have to access to RU - utilities - printers folder and you should see something like this:",br(),
                                                                                               br(),
                                                                                               fluidPage(img(src = "m452dw1.png",
                                                                                                             width = 700, align ="left")),br(),
                                                                                               br(),
                                                                                               "As you can see there is a driver for the M452DW printer installed on the register, 
                                                                                           this driver is installed automatically when you plug the USB on the back of the register to the printer,
                                                                                           if it does not try connecting it on another port",br(),
                                                                                               br(),
                                                                                               "Now click on the driver and go to see what's printing, you should get the following image:",br(),
                                                                                               br(),
                                                                                               fluidPage(img(src = "M452DW2.png",
                                                                                                             width = 400, align ="left")),br(),
                                                                                               br(),
                                                                                               "Access to properties and the following will appear:",br(),
                                                                                               br(),
                                                                                               fluidPage(img(src = "M452DW3.png",
                                                                                                             width = 400, align ="left")),br(),
                                                                                               br(),
                                                                                               "Go to sharing and tick the sharing option so the driver of the printer can be shared to the other registers",br(),
                                                                                               br(),
                                                                                               "Go to the other registers and access to the printers folder, the following should appear", br(),
                                                                                               br(),
                                                                                               fluidPage(img(src = "M452DW4.png",
                                                                                                             width = 400, align ="left")),br(),
                                                                                               br(),
                                                                                               "Go to add a printer and select *the printer that I want is not listed*, the following should open:",br(),
                                                                                               br(),
                                                                                               fluidPage(img(src = "M452DW7.png",
                                                                                                             width = 400, align ="left")),br(),
                                                                                               br(),
                                                                                               "Select browse and select the computer that has the printer connected and the shared driver",br(),
                                                                                               br(),
                                                                                               fluidPage(img(src = "M452DW9.png",
                                                                                                             width = 400, align ="left")),br(),
                                                                                               br(),
                                                                                               "Select the driver and install it, click next on all pop ups and continue after that send a test print and you are done.",br(),
                                                                                               "Once that is done just repeat the steps on the other auxiliary registers and the printer has been installed."
                                                                                      ),
                                                                                      
                                                                                      
                                                                                      
                                                                                      
                                                                                      
                                                                                      tabPanel("Error messages",br(),
                                                                                               br(),
                                                                                               tags$a(href = KB75919, style = "color:green", "KB75919"),strong("<- Source"),br(),
                                                                                               br(),
                                                                                               "On source you can look for all the error messages, the KB is self explanatory"
                                                                                               
                                                                                               
                                                                                      ),
                                                                                      
                                                                                      tabPanel("HP1_mono install",
                                                                                                
                                                                                               
                                                                                               
                                                                                               ),
                                                                                      
                                                                                      
                                                                                      tabPanel("Certificate installation",br(),
                                                                                               br(),
                                                                                               h3(tags$a(href = "https://aspire.percipio.com/channels/66d5ac53-31f4-4ca7-b57b-c559e1e49152" , 
                                                                                                         "Click here to go to the certificate installation video on youtube")))
                                                                                      
                                                                          ),
                                                                          
                                                                          
                                                                 ),
                                                                 tabPanel("M402DW",br(),
                                                                          fluidPage(img(src = "M402DW.png", 
                                                                                        height = 150, width = 200, align ="left")),br(),
                                                                          tabsetPanel(type = "tabs",
                                                                                      tabPanel("Not pinging"),
                                                                                      tabPanel("USB not printing",br(),
                                                                                               strong(tags$a(href = "https://iaas.service-now.com/nav_to.do?uri=%2Fkb_view_customer.do%3Fsys_kb_id%3Dc4ef9e1d0f9d7a0047c64d8ce1050e3e%26sysparm_language%3D%26sysparm_nameofstack%3D%26sysparm_kb_search_table%3D%26sysparm_tasksearch_company%3D%26sysparm_search%3DKB75361%26sysparm_extcall%3D%26sysparm_extreference%3D%26sysparm_extsubsystem%3D%26sysparm_cms%3D%26sysparm_u_channel%3Dnull%26sysparm_topic%3D%26sysparm_category%3D%26sysparm_search_method%3Dservicenow"
                                                                                                             ,style = "Color:Green", "KB75361"), "<- Source"),br(),
                                                                                               br(),
                                                                                               "The printer uses USB A to USB B",br(),
                                                                                               br(),
                                                                                               fluidPage(img(src = "USBB.png", 
                                                                                                             height = 150, width = 200, align ="left")),br(),
                                                                                               "The printer has to be connected on the back of the register (the motherboard)",br(),
                                                                                               "Once connected you have to access to RU - utilities - printers folder and you should see something like this:",br(),
                                                                                               br(),
                                                                                               fluidPage(img(src = "m452dw1.png",
                                                                                                             width = 700, align ="left")),br(),
                                                                                               br(),
                                                                                               "As you can see there is a driver for the M452DW printer installed on the register, 
                                                                                           this driver is installed automatically when you plug the USB on the back of the register to the printer,
                                                                                           if it does not try connecting it on another port",br(),
                                                                                               br(),
                                                                                               "Now click on the driver and go to see what's printing, you should get the following image:",br(),
                                                                                               br(),
                                                                                               fluidPage(img(src = "M452DW2.png",
                                                                                                             width = 400, align ="left")),br(),
                                                                                               br(),
                                                                                               "Access to properties and the following will appear:",br(),
                                                                                               br(),
                                                                                               fluidPage(img(src = "M452DW3.png",
                                                                                                             width = 400, align ="left")),br(),
                                                                                               br(),
                                                                                               "Go to sharing and tick the sharing option so the driver of the printer can be shared to the other registers",br(),
                                                                                               br(),
                                                                                               "Go to the other registers and access to the printers folder, the following should appear", br(),
                                                                                               br(),
                                                                                               fluidPage(img(src = "M452DW4.png",
                                                                                                             width = 400, align ="left")),br(),
                                                                                               br(),
                                                                                               "Go to add a printer and select *the printer that I want is not listed*, the following should open:",br(),
                                                                                               br(),
                                                                                               fluidPage(img(src = "M452DW7.png",
                                                                                                             width = 400, align ="left")),br(),
                                                                                               br(),
                                                                                               "Select browse and select the computer that has the printer connected and the shared driver",br(),
                                                                                               br(),
                                                                                               fluidPage(img(src = "M452DW9.png",
                                                                                                             width = 400, align ="left")),br(),
                                                                                               br(),
                                                                                               "Select the driver and install it, click next on all pop ups and continue after that send a test print and you are done.",br(),
                                                                                               "Once that is done just repeat the steps on the other auxiliary registers and the printer has been installed."
                                                                                      ),
                                                                                      tabPanel("Not printing")
                                                                                      
                                                                                      
                                                                          ),
                                                                          
                                                                          
                                                                          
                                                                 )
                                                     )
                                            ),
                                            
                                            
                                            tabPanel("Pinpad",br(),
                                                     fluidPage(img(src = "pinpad.png", 
                                                                   height = "40%", width = "60%", align ="left")),br(),
                                                     br(),
                                                     fluidPage(img(src = "pinpad1.png", 
                                                                   height = "40%", width = "60%", align ="left")),br(),
                                                     br(),
                                                     fluidPage(img(src = "pinpad2.png", 
                                                                   height = "40%", width = "60%", align ="left")),br(),
                                                     br(),
                                                     fluidPage(img(src = "pinpad3.png", 
                                                                   height = "40%", width = "60%", align ="left")),br(),
                                                     
                                            ),
                                            
                                            
                                            
                                            
                                            tabPanel("Scanners",br(),
                                                     tabsetPanel(type = "tabs",
                                                                 
                                                                 tabPanel("DS2278",br(),
                                                                          fluidPage(img(src = "DS22.png", 
                                                                                        height = 300, align ="left")),br(),
                                                                          fluidPage(img(src = "zebrasc1.png", 
                                                                                        height = 300, align ="left")),br(),
                                                                          fluidPage(img(src = "zebrasc2.png", 
                                                                                        height = 300, align ="left"))
                                                                 ),
                                                                 
                                                                 tabPanel("GBT4400/GBT4410",br(),
                                                                          fluidPage(img(src = "GBT4400.png", 
                                                                                        height = 300, align ="left")),br(),
                                                                          
                                                                 ),
                                                                 
                                                                 
                                                                 
                                                                 
                                                                 
                                                                 tabPanel("Gryphon™ I GD44XX (Wired scanner)",br(),
                                                                          fluidPage(img(src = "scane1.png", 
                                                                                        height = 300, align ="left")),br(),
                                                                          fluidPage(img(src = "scane2.png", 
                                                                                        height = 300, align ="left")),br(),
                                                                          
                                                                          )
                                                                 
                                                     )
                                                     
                                                    
                                            ),
                                            
                                            tabPanel("Receipt printer / cashdrawer",br(),
                                                     
                                                     tabsetPanel(type = "tabs",
                                                                 tabPanel("Receipt printer",br(),
                                                                          tabsetPanel(type = "tabs",
                                                                          tabPanel("TM-T88I to TM-T88III",br(),
                                                                                   "From I to III the receipt printers have only a data port to connect to the register",br(),
                                                                                   "It has to be connected to COM 1 in the register",br(),
                                                                                   fluidPage(img(src = "TM.png", 
                                                                                                 height = 300, align ="left")),br(),
                                                                                   br(),
                                                                                   fluidPage(img(src = "TM1.png", 
                                                                                                 height = 300, align ="left")),br(),
                                                                                   br(),
                                                                                   fluidPage(img(src = "TM3.png", 
                                                                                                 height = 300, align ="left")),br(),
                                                                                   ),
                                                                          tabPanel("TM-T88IV to TM-T88V",br(),
                                                                                   "This one does have both a data port and a USB B connection, only one of them has to be connected. 
                                                                                   If you use the data port it has to be connected on COM 1. If you use USB it has to be in the back of the computer.",br(),
                                                                                   br(),
                                                                                   fluidPage(img(src = "TM5.png", 
                                                                                                 height = 300, align ="left")),br(),
                                                                                   br(),
                                                                                   fluidPage(img(src = "TM4.png", 
                                                                                                 height = 300, align ="left")),br(),
                                                                                   
                                                                                   
                                                                                   )
                                                                          
                                                                          
                                                                          ),br(),
                                                                          
                                                                          
                                                                 ),
                                                                 
                                                                 tabPanel("Cash drawer",br(),
                                                                          fluidPage(img(src = "CW1.png", 
                                                                                        height = 400, align ="left")),br(),
                                                                          fluidPage(img(src = "CW2.png", 
                                                                                        height = 400, align ="left")),br(),
                                                                          fluidPage(img(src = "CW3.png", 
                                                                                        height = 400, align ="left")),br(),
                                                                          
                                                                 )
                                                     )
                                            ),
                                            
                                            tabPanel("Label printer",br(),
                                                     tabsetPanel(type ="tabs",
                                                                 tabPanel("ZD410",br(),
                                                                          fluidPage(img(src = "ZD410.png", 
                                                                                        height = 200, width = 220, align ="left")),br(),
                                                                          tabsetPanel(type = "tabs",
                                                                                      tabPanel("Not printing")
                                                                          )
                                                                 ),
                                                                 tabPanel("LP2824 & LP2824+",br(),
                                                                          fluidPage(img(src = "LP28.png", 
                                                                                        height = 160, width = 180, align ="left")),br(),
                                                                          tabsetPanel(type = "tab",
                                                                                      tabPanel("Not printing"))
                                                                          
                                                                 )
                                                     ),
                                                     
                                            )
                                        )
                                        
                                        
                                ),    #Final tab peripherals
                                
                                
                                tabItem(tabName = "main_menu",
                                        img(
                                            src = "https://upload.wikimedia.org/wikipedia/commons/d/d0/RStudio_logo_flat.svg", 
                                            height = 45, width = 50, align ="right"),
                                        h1("Main menu"),
                                        h3(strong("Welcome!!")),br(),
                                        "I really hope that this web page helps each and everyone of you, I will no longer update it. Nevertheless if a process starts getting outdated please let me know via Teams and I can eliminate it so it does not create confusion with new co-workers ",br(),
                                        br(),
                                        
                                        fluidRow(
                                            tabBox(width = 14,
                                                   
                                                   
                                                   tabPanel(title = "Phone numbers",
                                                            
                                                            strong(h3("Most used")),br(),
                                                            strong("GV:"), "817-722-7990",br(),
                                                            strong("NOC team:"), "800-859-7821 ID 0152",br(),
                                                            strong("Store dedicated:"), "877-610-7529",br(),
                                                            strong("HR:"),"(866) 637-4387 (monday through friday)",br(),
                                                            strong("Our Number:"), "888-435-7860 iaas@service-now.com",br(),
                                                            strong("ComQi Customer Support:")," (8AM - 8PM EST Mondays - Friday) - 866-387-7667",br(),
                                                            
                                                            strong(h3("More phone numbers")),br(),
                                                            strong("Customer care:"),"(800) 883-8895",br(),
                                                            strong("Fusion:"),"888-838-5302 (monday to friday)",br(),
                                                            strong("Loss prevention:"),"The store has the number under the GSO contacts",br(),
                                                            strong("CC SD:"),"888-557-4129",br(),
                                                            strong("GS TV:"), "800-678-4151 Ext. 1",br(),
                                                            strong("8X8 (VOIP SD):"), "866-496-1403",br(),
                                                            strong("GameStop IT:"), "817-722-7511 Option 1 (for corporate)",br(),
                                                   ),
                                                   
                                                   
                                                   tabPanel(title = "Helpful tickets",
                                                            strong("PRB´s (This is a general problem that is like a global ticket number): "),br(),
                                                            br(),
                                                            "PRB52131 - Print out end of day win 10 ",br(),
                                                            "PRB52389 - Fedex password ",br(),
                                                            "PRB51038 - Pinpad offline",br(),
                                                            "PRB52482 - OKTA not opening on the surfaces",br(),
                                                            "PRB52632 - Surface not auto rotating ",br(),
                                                            br(),
                                                            strong("Genral tickets:"),br(),
                                                            "INC34210004 - Email loading message",br(),
                                                            "INC34268805 - Poll ticket Ready state (LVL 3)",br(),
                                                            "INC34521111 - LVL 3 canada INC",br(),
                                                            "INC34592311 - cash drawer win 10",br(),
                                                            "INC34697595 - Fingerprint scanner ",br(),
                                                            "INC34714036 - Price change print",br(),
                                                            "INC34782023 - SKU showing $0.00",br(),
                                                            "INC34758666 - Firefox not loading ",br(),
                                                            "INC35426839 - re tech issue (PUR not appearing)",br(),
                                                            "INC36194393 - Pre order unable to post void ",br(),
                                                            "INC36831384 - unable to resume WIS",br(),
                                                            "INC38491008 - Retech source issue",br(),
                                                            strong(h3("Pseudo KB´s:")),br(),
                                                            strong("FORT processes:"),br(),
                                                            "INC38453473 - Fail Over + Failback (Switch and reverse)",br(),
                                                            "INC34109654 - Fail over ticket",br(),
                                                            "INC34048168 - Fail back ticket ",br(),
                                                            "INC39509969 - International FO + FB",br(),
                                                            br(),
                                                            strong("Database repair:"),br(),
                                                            "INC35747753 - All red DB repair",br(),
                                                            "INC39176483 - trans.mdb repair ",br(),
                                                            "INC34807959 - Store.INI corrupted",br(),
                                                            "INC34299929 - Databases corruptions",br(),
                                                            "INC34907430 - Manual database failure repair ",br(),
                                                            br(),
                                                            strong("Pinpad issues:"),br(),
                                                            "INC37481353 - Pinpad offline",br(),
                                                            "INC36822646 - Payment is taking longer success",br(),
                                                            "INC38147201 - Payment is taking longer failure",br(),
                                                            "INC36123188 - Pinpad Offline AJB not turning on ",br(),
                                                            br(),
                                                            strong("Printer issues:"),br(),
                                                            "INC39545339 - HP1_monoinstall Win X ",br(),
                                                            "INC38971218 - Win X receipt resolution (Ticket created by Pablo Hernandez)",br(),
                                                            br(),
                                                            strong("ICE Machine:"),br(),
                                                            "INC39423332 - Ice machine 2.5 install",br(),
                                                            "INC39475199 - Ice controller PS5",br(),
                                                            "INC37770965 - Ice machine controller error",br(),
                                                            br(),
                                                            strong("Surface:"),br(),
                                                            "INC37664497 - Auto flip not working",br(),
                                                            "INC38306250 - Dock not recognizing peripherals",br(),
                                                            ),
                                                   
                                                   
                                                   
                                                   
                                                   
                                                   tabPanel(title = (strong("Configuration Item")), status = "warning", width = 14, solidHeader = TRUE,
                                                            "GS asked us to change the CI for our created ticket.",br(),
                                                            br(),
                                                            "Now we have to input the configuration item with the store number and register number 
                                (USA0XXXX-R), and on the support function input the correspondant action for the following:",br(),
                                                            strong("Note:"),"For canadian stores you have to input CANXXXX - (Only 4 digists not 5 like USA stores)",br(),
                                                            br(),
                                                            fluidPage(  align ="center", img(src = "scenariosCI.png", 
                                                                                             height = "80%", width = "100%", align ="center")),br(),
                                                   )
                                            ),
                                        ),
                                ),
                                
                                
                                
                                
                                tabItem(tabName = "polling",
                                        img(
                                            src = "https://upload.wikimedia.org/wikipedia/commons/d/d0/RStudio_logo_flat.svg", 
                                            height = 45, width = 50, align ="right"),
                                        h1("Polling"),
                                        
                                        br(),
                                        tabsetPanel(type = "tab",
                                                    tabPanel("What is Polling?",br(),
                                                             "GS has a central corporate, this corporate sends a lot of information to all stores, for example",br(),
                                                             "-Price changes",br(),
                                                             "-New SKU's for games or items",br(),
                                                             "-Changes made to the register for them to work better",br(),
                                                             br(),
                                                             "With a poll you can pull all this information",br(),
                                                             "But the stores also have to send their information to corporate, for example",br(),
                                                             "-Total sales",br(),
                                                             "-Employee performance",br(),
                                                             "-Total amount of money they have at the end of the day",br(),
                                                             br(),
                                                             "And a lot more, a poll also sends this information to corporate",br(),
                                                             "With something that we call a force poll, we can make a store poll at anytime if we need to, this is explained on the following tabs"
                                                                                       
                                                             
                                                             ),
                                                    tabPanel("R1 not polled",br(),
                                                             strong(tags$a(href = KB100220, style = "color:green", "KB100220")), "<- This KB is the one for a not polled register in case this tab does not work",br(),
                                                             br(),
                                                             "The polling application is quite simple, it just checks if there is an extra file on the C:\\poll\\send folder",br(),
                                                             "If there is an extra file on that folder the program will appear as not polled and if there are no extra files, it will say polled",br(),
                                                             br(),
                                                             fluidPage(img(src = "POLL1.png", 
                                                                           width = "600", align ="left")),br(),
                                                             br(),
                                                             "There are 3 reasons because this file is not being sent",br(),
                                                             "- There was a bug in the middle of the poll and it was not sent",br(),
                                                             "- There is a database corruption and the EXPORT.EXE program does not work correctly",br(),
                                                             "- There is a file on the send folder that did not sent with everything else, this may happen because a file corruption",br(),
                                                             br(),
                                                             "to poll a register correctly you can follow this steps",br(),
                                                             h3("Step 1"),br(),
                                                             "Close the governor in the processes tab (Win 7) or just close it (Win 10), you should have a black background with the property of GS in the background",br(),
                                                             h3("Step 2"),br(),
                                                             "Open the file explorer with Restricted utilities and access to the C:\\poll\\send folder",br(),
                                                             "Here you will see either a window full of folders or a window with folders and files, if you see files you can erase them all",br(),
                                                             strong("YOU CAN JUST ERASE FILES, DO NOT ERASE FOLDERS"),br(),
                                                             h3("Step 3"),br(),
                                                             "Force poll the register with RU"
                                                                                                                        
                                                             
                                                            
                                                             ),
                                                    tabPanel("Promotions not showing",br(),
                                                             strong(tags$a(href = KB71907, style = "color:green", "KB71907")),"<- C2S file transfer KB ",br(),
                                                             br(),
                                                             
                                                                      "When a promotion is not working that means that the C2S files were not imported correctly, so we have to manually import the files",br(),
                                                             br(),
                                                                      "1.- On your Citrix desktop, go to the tools shortcut, open Devtools - Help Desk Approved tools - Reset security (Global)",
                                                                      "open the program and input the number of your store - Example: if your store is store USA05555, input 5555, on the following messages just press
                                                                                  ok on both messages",br(),
                                                                      br(),
                                                                      "2.- Remote to R1 file explorer and access to c:\\poll\\receive, leave this window open while you perform step 3.",br(),
                                                                      br(),
                                                                      "3.- Go to the tools shortcut, open Devtools - Go to POSDown Archives - archives - You should now see a list of folders named by date in YYYYMMDD format 
                                                                                  (Ex: 20201220 = 20th Dic. 2020.) Sort by Date Modified so the newest is at the top, and select the day BEFORE the current date you’re needing to drop the files on",br(),
                                                                      "Ex - If we are installing on the 4th of january of 2021 you have to open the file 20210103",br(),
                                                                      "Now you should see a list of numbers, this are store numbers so if you are installing store 5555 you must select the 5555 folder,
                                                                                  enter to the folder and copy it's files to the folder you opened on step 2 c:\\poll\\receive",br(),
                                                                      br(),
                                                                      "4.- We have to do the same process fo the actual day of the installation, so for the previous example we would have to open the 20210104
                                                                                  copy it's files to the c:\\poll\\receive your folder should be like the following:",br(),
                                                                      br(),
                                                                      fluidPage(img(src = "SF35.png", #imagen de C2S files con el c:\poll\receive
                                                                                    width = "800", align ="left")),br(),
                                                                      br(),
                                                                      "5.- Now that we have the C2S files and we performed the security reset we can now make a “Force Poll” ",br(),
                                                                      "Now open Restricted Utilities - go to the remotelink option (#1) - and select the force poll option, leave the computer make all it's processes and wait 
                                                                                  until the computer closes all the programs",br(),
                                                                      br(),
                                                                      
                                                                      
                                                                      "6.- Restart the R1 (when all the processes have finished)",br(),
                                                             br(),
                                                                      "7.- Check c:\\poll\\receive - if there are 2 folders ,back up and rejected, you can go ahead and boot the computer up"
                                                             ))
                                ),
                                
                                
                                tabItem(tabName = "surface",
                                        img(
                                            src = "https://upload.wikimedia.org/wikipedia/commons/d/d0/RStudio_logo_flat.svg", 
                                            height = 45, width = 50, align ="right"),
                                        h1("Surface"),strong("Info. provided by Saúl Velazquez & Raúl Blé"),br(),
                                        br(),
                                        tabsetPanel(type = "tab",
                                                    tabPanel("How does it look?",br(),
                                                             tabsetPanel(type = "tab",
                                                                         tabPanel("Front",br(),
                                                                                  fluidPage(img(src = "surf1.png", 
                                                                                                width = 600, align ="left")),br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "surf2.png", 
                                                                                                width = 600, align ="left")),br(),
                                                                                  
                                                                                  br(),
                                                                                  fluidPage(img(src = "surf7.png", 
                                                                                                width = 600, align ="left")),br(),),
                                                                         tabPanel("Back",br(),
                                                                                  fluidPage(img(src = "surf6.png", 
                                                                                                width = 600, align ="left")),br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "surf8.png", 
                                                                                                width = 600, align ="left")),br(),
                                                                                  
                                                                         ),
                                                                         
                                                                         tabPanel("Cables",br(),
                                                                                  fluidPage(img(src = "surf4.png", 
                                                                                                width = 600, align ="left")),br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "surf5.png", 
                                                                                                width = 600, align ="left")),br(),
                                                                         )
                                                                         
                                                                         
                                                             )
                                                             
                                                             
                                                             
                                                             
                                                             
                                                             
                                                    ),
                                                    
                                                    
                                                    tabPanel("Ticket creation",br(),
                                                             "First we have to open", strong(tags$a(href = "https://iaas.service-now.com/", style = "color:green", "SNOW")),
                                                             "so we can create our ticket",br(),
                                                             br(),
                                                             fluidPage(img(src = "SF1.png", 
                                                                           width = 300, align ="left")),br(),
                                                             br(),
                                                             "Once you are on logged in, on the left side you'll find on the incident tab > Records > create new",br(),
                                                             br(),
                                                             fluidPage(img(src = "SF2.png", 
                                                                           width = 300, align ="left")),br(),
                                                             br(),
                                                             "Once you are on that page you have tio create your new ticket with the following characteristics",br(),
                                                             br(),
                                                             fluidPage(img(src = "SF3.png", 
                                                                           width = "85%", align ="left")),br(),
                                                             br(),
                                                             "Then click on the save button so you can continue with the configuration of the INC",br(),
                                                             br(),
                                                             "The configuration has to be like the following:",br(),
                                                             br(),
                                                             fluidPage(img(src = "SF4.png", 
                                                                           width = "85%", align ="left")),br(),
                                                             br(),
                                                             "Remeber to input the Master incident INC35858803",br(),
                                                             br(),
                                                             fluidPage(img(src = "SF5.png", 
                                                                           width = "85%", align ="left")),br(),
                                                             br(),
                                                             
                                                             
                                                    ),
                                                    
                                                    
                                                    tabPanel("Track IT",br(),
                                                             tabsetPanel(type = "tab",
                                                            tabPanel("Store selection",br(),
                                                              "First we have to open", strong(tags$a(href = trackit, style = "color:green", "Track IT")),
                                                             "once you log in you have to select the Gamestop POS Upgrade 2020 option.",br(),
                                                             br(),
                                                             "Then you have to find your store, to look for it you have to select the magnifying glass on the left
                                                              ,input your store number and click on search",br(),
                                                             br(),
                                                             fluidPage(img(src = "SF9.png", 
                                                                           width = "500", align ="left")),br(),
                                                             br(),
                                                             "Click on tasks and select the store that has the 'Install Gamestop # - POS revisit'",br(),                                                             br(),
                                                             br(),
                                                             fluidPage(img(src = "SF6.png", 
                                                                           width = "500", align ="left")),br(),
                                                             br(),
                                                            ),
                                                            
                                                            tabPanel("Onsite milestones",br(),
                                                                     "Scroll down to the Onsite milestone part of the store tab and you will see checkmarks with a milestone
                                                                     on the right side",br(),
                                                                     br(),
                                                                     fluidPage(img(src = "SF7.png", 
                                                                                   width = "500", align ="left")),br(),
                                                                     br(),
                                                                     "You have to select this milestones when you finished the task, a time stamp will be created and your
                                                                     issue will be solved on our end."
                                                                    ),
                                                            tabPanel("Issue creation",br(),
                                                                     "To create an issue you have to go to the Warning icon on the top right corner",br(),
                                                                     br(),
                                                                     fluidPage(img(src = "SF8.png", 
                                                                                   width = "300", align ="left")),br(),
                                                                     br(),
                                                                     "The following screen will appear:",br(),
                                                                     br(),
                                                                     fluidPage(img(src = "SF10.png", 
                                                                                   width = "600", align ="left")),br(),
                                                                     br(),
                                                                     "For example: you can create an issue when the technician is taking longer than expected to set the IP address",br(),
                                                                     br(),
                                                                     fluidPage(img(src = "SF11.png", 
                                                                                   width = "600", align ="left")),br(),
                                                                     br(),
                                                                     "Once your issue has been resolved you have finish the task",br(),
                                                                     br(),
                                                                     fluidPage(img(src = "SF12.png", 
                                                                                   width = "600", align ="left")),br(),
                                                                     br(),
                                                                     "Save the task, and the issue has been solved",br(),
                                                                     
                                                                     
                                                                     )
                                                             
                                                    )),
                                                    
                                                    tabPanel("Access to Restricted utilities (RU)",br(),
                                                             "To access to Restricted Utilities (RU) you have to open it on your desktop, under the tools shortcut on the 
                                                             right side of the screen. Once it opens, we will select the folder named Tools-Shortcut and then we will right click
                                                             the POS PasswordGenerator program, so we can ",strong("Run as administrator."),"If you do not
                                                             have the folder you can open the RUN application and type \\\\gvfile1\\IS\\HelpDesk\\Tools",br(),
                                                             br(),
                                                             fluidPage(img(src = "SF17.png", #Foto de la desktop, 
                                                                           width = "600", align ="left")),br(),
                                                             br(),
                                                             fluidPage(img(src = "SF18.png", #Foto de PW generator, 
                                                                           width = "400", align ="left")),br(),
                                                             br(),
                                                             "On the register press ctrl + esc (it can be inyected on TRC) and select Restricted utilities on the menu",br(),
                                                             "Where it says Enter Store # we will input the 4 digits of the store (or less if store has less number),
                                                             and on Enter Reg. # we will input the register we are working with.",strong("In case that the date does not match the current day,
                                                                                                                                         we will change it by pressing Change Date and
                                                                                                                                         select the date technician provide us"), strong(style = "color:red", 
                                                                                                                                                                                         "THIS ONLY WORKS IF IT WAS RUN AS ADMIN."),br(),
                                                             br(),
                                                             "Once we input the password now we have acces to" ,strong("RU"), ",and there we can continue with a lot of parts of the process."
                                                             ),
                                                    
                                                    
                                                    tabPanel("Store tec support (STS)",br(),
                                                             fluidPage(img(src = "citrix4.png", 
                                                                           width = 600, align ="left")),br(),
                                                             br(),
                                                             "Store tec support is the most useful application, here you can know if a store has network connection or if a register is connected to it
                                                                                       , or if the printer is connected to the network, and much much more!!",br(),
                                                             br(),
                                                             "The GUI of the application is shown on the following images:",br(),
                                                             br(),
                                                            
                                                             strong("Store techincal support"),br(),
                                                             br(),
                                                             fluidPage(img(src = "sts.png", 
                                                                           width = 600, align ="left")),br(),
                                                             br(),
                                                             fluidPage(img(src = "sts1.png", 
                                                                           width = 600, align ="left")),br(),
                                                             br(),
                                                             "On this example the IP of the store is 10.197.254.XX, the last 3 numbers are what differentiates the specific hardware of the store",br(),
                                                             "For example 10.197.254.11 is Register 1, 10.197.254.200 is the router, 10.197.254.34 is the network printer, 10.197.254.15 is register 3, and so on...",br(),
                                                             br(),
                                                             strong("The pinger"),br(),
                                                             "Here you can know if a store is pinging, a ping is a signal that you send to a hardware, if it is connected to the network
                                                                                       it will be as the image on the left (greeen), and if it is not connected it will be as the one on the right (red)",br(),
                                                             br(),
                                                             "To access to the pinguer just click on ping on the hardware that you want to ping.",br(),
                                                             br(),
                                                             fluidPage(img(src = "SF19.png", 
                                                                           width = 600, align ="left")),br(),
                                                             
                                                             fluidPage(img(src = "sts4.png", 
                                                                           width = 600, align ="left")),br(),
                                                             
                                                             br(),
                                                             
                                                    ),
                                                    
                                                    
                                                    tabPanel("Installation of R1 & R2",br(),
                                                             tabsetPanel(type = "tab",
                                                                         tabPanel("R2 Verifications",br(),
                                                                                  "When the technician finishes the installation of R2 you have to check 4 things
                                                                                  before you startt with the fail over process:",br(),
                                                                                  br(),
                                                                                  "1.- Check if the surface is getting power from the power cable (If the surface
                                                                                  is not connected it will go to sleep mode in 10 minutes).",br(),
                                                                                  "To check this you have to go to Restricted utilities (Look it on the STS tab), after that go to
                                                                                  display settings -  return to the windows main menu - On the search bar write battery - see if the battery is charging",br(),
                                                                                  br(),
                                                                                  "2.- Tell the technician to open the surface front part of the case and check if it has the following cables connected to it (those cables
                                                                                  come from the back part of the surface case)",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF13.png", 
                                                                                                width = "600", align ="left")),br(),
                                                                                  br(),
                                                                                  "3.- Ask the technician if all the cables connected to the dock have lights on them, the cables have to look like this:",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "surf4.png", 
                                                                                                width = 500, align ="left")),br(),
                                                                                  br(),
                                                                                  "If the tech tells you that there are no lights follow", tags$a(href = KB124564, style = "color:green", "KB124564"),br(),
                                                                                  br(),
                                                                                  "4.- Ask the tech the model of the receipt printer, if it is TM - T88V the tech should have a USB A to USB B cable (this model accepts this cable),
                                                                                  if the tech tell you that he has a TM - T88IV or TM - T88III, this printers only have a datacable port so we need the adapter for the surface",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF16.png", 
                                                                                                width = 500, align ="left")),br(),
                                                                                  br(),
                                                                                  
                                                                                  
                                                                                  "If you completed all this verifications you can now continue with the set up of the IP." 
                                                                                  
                                                                         ),
                                                                         
                                                                         
                                                                         tabPanel("IP setup R2",br(),
                                                                                  strong(h4("Important: You must restart the computer after the IP is set, omiting this will mess up the 
                                                                                            Fail over process")),
                                                                                  tabsetPanel(type = "tab" ,
                                                                                              tabPanel("Old method",br(),
                                                                                                       "This steps are going to be done by the technician, we will guide the technician through it.",br(),
                                                                                                       br(),
                                                                                                       "1.- Open the main menu with ctrl + esc and select Restricted Utilities (RU) *Follow the tab 'access to Restricted Utilities (RU)'*",br(),
                                                                                                       br(),
                                                                                                       "2.- Once the technician has access to RU ask him what is the title of the tool, if it is Restricted utilities V5.5.2.0 you can do the New method 
                                                                                                       (Faster & easier), if it only says Restricted utilities, you have to continue with the old method step 3.",br(),
                                                                                                       br(),
                                                                                                       "3.- Go to tools (option #5), select DOS prompt, this will open a command prompt.",br(),
                                                                                                       br(),
                                                                                                       "4.- On the CMD prompt input - " ,strong("runas /u:possvrsvc cmd"), " - password: " ,strong("p0$$vr$vc"), " (it will not appear but it is aplying the text), 
                                                                                                       this will open an administrator command prompt, please ask the tech if the administrator word is on the top of the CMD prompt window.",br(),
                                                                                                       br(),
                                                                                                       "5.- Input - " ,strong("ipconfig"), " - the following will appear:",br(),
                                                                                                       br(),
                                                                                                       fluidPage(img(src = "SF14.png", 
                                                                                                                     width = "600", align ="left")),br(),
                                                                                                       br(),
                                                                                                       "When the technician enters the ipconfig command, it is very important to verify the different “adapters” 
                                                                                                        that appear on the list, ONLY ONE of the adapters will show an IP ADDRESS, in the
                                                                                                       last picture we have the adapter called " ,strong("Ethernet Adapter Ethernet 2"), " each computer is different
                                                                                                       and it will appear with different names like " ,strong("Ethernet"), " or some other name, in the picture we have
                                                                                                       several adapters that start with " ,strong("Wireless LAN adapter"), " or " ,strong("Ethernet adapter"), ", from all of these
                                                                                                       we will only use the one that has an " ,strong("IP address"), ", once we locate the one with the ip address
                                                                                                       ,we will ask the technician to let us know the whole name of the adaptor.",br(),
                                                                                                       strong("Some of the adapters that has no IP ADDRESS will appear like “Media Disconnected” (green area)"),
                                                                                                       strong(style = "color:red", "VERY IMPORTANT NOT TO USE ANY OF THOSE ADAPTERS."),br(),
                                                                                                       br(),
                                                                                                       "6.- Access to store tech support so you can get the IP settings for register 2, the subnet mask & the gateway, we will use them for the 
                                                                                                       command on step 7",br(),
                                                                                                       br(),
                                                                                                       "7.- type -",strong(" netsh interface ipv4 set address name=“NetworkAdapterName” static ") ,strong(style= "color:green","10.XXX.XXX.12"), " " ,strong(style= "color:blue","255.255.255.224"), 
                                                                                                       " " ,strong(style= "color:red","10.XXX.XXX.1"),br(),
                                                                                                       " " ,strong(style = "color:green" ,"Green = IP R2"), " , " ,strong(style = "color:blue" ,"blue = subnet mask"), 
                                                                                                       ", " ,strong(style = "color:red" ,"red = gateway"), "",br(),
                                                                                                       "In this example the Network adapter name will be " ,strong("“Ethernet 2”"), ", this may change on your computer, remember to input the one on the
                                                                                                       ethernet adapter with the IP (previously explained), ",strong("We will never use “NetworkAdapterName” to set an IP."),br(),
                                                                                                       br(),
                                                                                                       "Posible Network adapter names:",br(),
                                                                                                       br(),
                                                                                                       "“Local Area connection”",br(),
                                                                                                       "“Local Area connection 2”",br(),
                                                                                                       "“Ethernet”",br(),
                                                                                                       "“Ethernet 2”",br(),
                                                                                                       br(),
                                                                                                       strong("Note: This are case sensitive"),br(),
                                                                                                       br(),
                                                                                                       "The technician may have some of the following", strong("errors:"),br(),
                                                                                                       br(),
                                                                                                       " ",strong("A) invalid address parameter"), "- There is no space between the first and second IP addresses and tech will need to put a space
                                                                                                       between those 2 to make it work.",br(),
                                                                                                       " ",strong("B) The filename, directory name or volume label syntax is incorrect"), "- In this specific error the technician forgot
                                                                                                       to use the quotation marks in the “NetworkAdapterName” to correct this he will need to type name=”Ethernet 2”",br(),
                                                                                                       "If there are no errors continue to step 8.",br(),
                                                                                                       br(),
                                                                                                       "8.- If the previous steps were followed correctly we should be able to remote to the register so we can input the next commands 
                                                                                                       (This depends of you, you can tell the technician the next commands as well so he inputs them).",br(),
                                                                                                       br(),
                                                                                                       "9.- input -", strong(" netsh interface ipv4 set dns name=”NetworkAdapterName” static "), strong(style = "color:red", "10.XXX.XXX.1"),br(),
                                                                                                       "This is the same as the gateway (that is why is red),it is called the DNS, after this is set nothing will happen but it will be set.",br(),
                                                                                                       br(),
                                                                                                       "10.- input -",strong(" netsh interface ipv4 add dns name=”NetworkAdapterName” addr=10.159.20.20 index=2"),br(),
                                                                                                       "This is the DNS 2 and it is the same for all registers on all GS stores.",br(),
                                                                                                       br(),
                                                                                                       "11.- Check if the register does ping (STS tab explains how to ping), Remote to the register (If you haven't), inject ctrl + esc - tools - get ip settings,
                                                                                                       If the window that pops up has the correct IP restart the computer. After the restart R2 should ask for the password to open RU of store XXXX, R2, if that is the case
                                                                                                       you are good to go to continue with the Fail over process."
                                                                                                       
                                                                                                       
                                                                                                      
                                                                                                       
                                                                                                       
                                                                                                       
                                                                                                       ),
                                                                                              
                                                                                              tabPanel("New method",br(),
                                                                                                       "This steps are going to be done by the technician, we will guide the technician through it.",br(),
                                                                                                       br(),
                                                                                                       "1.- Open the main menu with ctrl + esc and select Restricted Utilities (RU) *Follow the tab “access to Restricted Utilities (RU)”*",br(),
                                                                                                       br(),
                                                                                                       "2.- Once the technician has access to RU ask him what is the title of the tool, if it is Restricted utilities V5.5.2.0 you can do the New method 
                                                                                                       (Faster & easier), if it only says Restricted utilities, you have to set the IP with the old method",br(),
                                                                                                       br(),
                                                                                                       fluidPage(img(src = "SF15.png", 
                                                                                                                     width = "400", align ="left")),br(),
                                                                                                       br(),
                                                                                                       "3.- If this is the new restricted utilities you have to tell the tech to access to network (option #3), then go to set IP address and set the IP",br(),
                                                                                                       strong(style= "color:green","10.XXX.XXX.12 - R2 IP,"), strong(style= "color:blue","255.255.255.224 - Subnet mask,"), strong(style= "color:red","10.XXX.XXX.1 - Gateway,"),br(),
                                                                                                       br(),
                                                                                                       fluidPage(img(src = "IPR2.png", 
                                                                                                                     width = "600", align ="left")),br(),
                                                                                                       br(),
                                                                                                       "4.- Once the IP has been set you can remote to the register and input the DNS or tell the technician to input the DNS as well",br(),
                                                                                                       strong(style = "color:gray", "DNS1 = Same as gateway,"), strong(style = "color:orange", "DNS2 = 10.159.20.20"),br(),
                                                                                                       br(),
                                                                                                       "5.- Restart the computer after the IP has been set, after the restart R2 should ask for the password to open RU of store XXXX, R2 - if that is the case 
                                                                                                       you can continue with the E-mail back up"
                                                                                                       
                                                                                                       
                                                                                                       
                                                                                                       )
                                                                                              
                                                                                              
                                                                                              ),
                                                                                  
                                                                                  
                                                                                  
                                                                                  ),
                                                                         
                                                                         
                                                                         tabPanel("E-mail back up",br(),
                                                                                  
                                                                                  "1.- Access to the file explorer of R1.",br(),
                                                                                  "To make this you have to open the citrix desktop and access to a file explorer",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF20.png", 
                                                                                                width = "800", align ="left")),br(),
                                                                                  br(),
                                                                                  "Once you entered the store the file explorer will ask for a password, you must use", strong("user:possvrsvc - PW:p0$$vr$vc"),br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF21.png", 
                                                                                                width = "500", align ="left")),br(),
                                                                                  br(),
                                                                                  "Select the C drive and go to \\pos\\mail - There right click the inbox folder, select cut and paste it on your citrix desktop,
                                                                                  We will save this e mails for the last part of our installation",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF22.png", 
                                                                                                width = "400", align ="left")),br(),
                                                                                  br(),
                                                                                  
                                                                                  ),
                                                                                  
                                                                                         
                                                                         
                                                                         tabPanel("Fail Over PT.1",br(),
                                                                                  
                                                                                  h3("To access to Old RU open a command prompt and input - restrictedutilities.exe - The following will open"),br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF49.png", 
                                                                                                width = "400", align ="left")),br(),
                                                                                  br(),
                                                                                  "1.- on store tech support make sure that all the registers except R1 & R2 are off, this can be done with the pinger (STS tab),
                                                                                  If only R1 & R2 are pinging you can continue with step 2",br(),
                                                                                  br(),
                                                                                  "All auxilliary registers should be as follows:",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF23.png", 
                                                                                                width = "400", align ="left")),br(),
                                                                                  br(),
                                                                                  strong("Only R1 and R2 must ping."),br(),
                                                                                  br(),
                                                                                  "2.- Now that all the aux registers are off we will remote to R1 and R2, the best way to remote is to have both of them open at the same time
                                                                                  because we will need to do a lot of processes on both, exemplefied on the image below",br(),
                                                                                  "To remote to the registers we will use an application called TRC remote (located on the right side of your remote desktop [Yellow square on the image])",br(),
                                                                                  "To access to the registers we have to input the IP of the register that we need to access, and use -", strong("username: storeuser - PW: storeuser"),
                                                                                  "if that does not let you you can try -",strong(" username: possvrsvc - PW: p0$$vr$vc"),br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF25.png", 
                                                                                                width = "700", align ="left")),br(),
                                                                                  fluidPage(img(src = "SF26.png", 
                                                                                                width = "600", align ="left")),br(),
                                                                                  fluidPage(img(src = "SF24.png", 
                                                                                                width = "1000", align ="left")),br(),
                                                                                  br(),
                                                                                  "3.- Once you are on the registers open RU on both of them",br(),
                                                                                  "To open RU inyect ctrl + escape with the inyect function  (Green square) and open Restricted utilities (To know how to access 
                                                                                  you can go to the tab [Access to RU])",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF27.png", 
                                                                                                width = "600", align ="left")),br(),
                                                                                  br(),
                                                                                  "Now input the password from password generator so you can access to RU",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF28.png", 
                                                                                                width = "800", align ="left")),br(),
                                                                                  br(),
                                                                                  "Your desktop should look similar to this:",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF29.png", 
                                                                                                width = "800", align ="left")),br(),
                                                                                  br(),
                                                                                  
                                                                                  ),
                                                                         
                                                                         tabPanel("Fail over PT.2",br(),
                                                                                  "4.- Close all the programs and processes that you can see on the computer, on this example we have to close GOV.EXE on R1 and
                                                                                  close Monitor.exe on R2",br(),
                                                                                  "To close them we have to open the task manager processes tab (On RU go to option utilities #2), and select task manager)",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF30.png", 
                                                                                                width = "400", align ="left")),br(),
                                                                                  br(),
                                                                                  "5.- Now that we are on a black screen on both registers we have to select on R1 RU (option tools #5) and select run DB backup,
                                                                                  then wait 10 seconds and go to R2, select Display BAK_1.zip file info, if the date is correct you can continue to step 6 ",
                                                                                  strong("if it is not contact any mentor so we can help you"),br(),
                                                                                  fluidPage(img(src = "SF31.png", 
                                                                                                width = "400", align ="left")),br(),
                                                                                  br(),
                                                                                  "6.- If the date is correct, turn off R1 & tell the technician to Start with the installation of the surface R1 
                                                                                  (Connect everything except the power cord)",br(),
                                                                                  br(),
                                                                                  h2("Disclaimer: For the FO you have to use OLD RU, Elevate Restricted Utilities is setting the IP address to .10 instead of .12", style = "color:red"),br(),
                                                                                  br(),
                                                                                  "7.- On R2 select the Fail Over recovery tool option (Located on tools #5), and select",strong("yes"),"on the pop up 
                                                                                  “Are you sure you want to launch the Fail Over Recovery Tool”",br(),
                                                                                  "Now the following window should appear",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF32.png", 
                                                                                                width = "500", align ="left")),br(),
                                                                                  br(),
                                                                                  "As you can see only the R2 square is blue, that means that only R2 is on, if there is another square open, please tell the tech to turn
                                                                                  off the register on question",br(),
                                                                                  br(),
                                                                                  "8.- Now click on the fail over button the message “Fail over to secondary” should appear, click", strong("yes"),"and the fail over will begin",br(),
                                                                                  strong("Note: You may have an error called Remote registry error, to fix that error you have to go to the tab called “Common issues -> Remote Registry” "),br(),
                                                                                  br(),
                                                                                  "9.- After you clicked yes on the fail over message the message “Verify backup file”, will appear", strong("Please check the date of the file"),"
                                                                                  if the file date is the same as the DBbackup we performed earlier click YES, if it is not correct",strong("Contact a mentor"),br(),
                                                                                  br(),
                                                                                  "10.- Then another message called “Verify missing Backup File” will appear",br(),
                                                                                  "As long as there is not any file with the extension", strong(".MDB"), "you can continue, if there is a file with an .MDB extension",strong("Please contact a mentor"),br(),
                                                                                  "After we clicked on YES, R2 will change it's name to R1 and the IP address will change to .11",br(),
                                                                                  br(),
                                                                                  "11.- R2 now is called Emergency R1 (ER1), we have to remote to ER1 with the IP address of R1",br(),
                                                                                  br(),
                                                                                  "12.- The message “Fail over complete” will appear, select OK on the message and ER1 will restart",br(),
                                                                                  br(),
                                                                                  "13.- After the restart remote to ER1, it shoould load all the way to the POS (back office and the menu), close back office (ctrl + shift + z - F5)
                                                                                  the computer should be on a black screeen, property of gamestop should be on the background",br(),
                                                                                  br(),
                                                                                  "14.- The Fail Over is completed, now we just have to wait for the tech to install R1 so we can continue with the ER1 to R2 part",br(),
                                                                                  br(),
                                                                                  "15.- Tell the tech to install all R1 except the power cord, he has to call before turning R1 on"
                                                                                  
                                                                                  
                                                                                  
                                                                                  
                                                                                  ),
                                                                         
                                                                         tabPanel("ER1 to R2",br(),
                                                                                  strong("Disclaimer: "),"Emergency Register 1 (ER1), this is R2 with the IP of R1, we have to change it back to the original IP.",br(),
                                                                                  br(),
                                                                                  strong("You have to do this step after the FO, R2 will remain off while the tech is installing R1"),br(),
                                                                                  br(),
                                                                                  "On Emergency Register 1 (Register 2):",br(),
                                                                                  br(),
                                                                                  "1.- Open Restricted utilities on ER1 and select the Fail Over Recovery Tool, the message",strong(" “Change Primary to Secondary” "),"will appear,
                                                                                  click YES and ER1 will shut down,",strong( "it will stay off"),", the computer will change the IP address to .12",br(),
                                                                                  br(),
                                                                                  "2.- Wait until the technician finishes R1",br(),
                                                                                  br(),
                                                                                  "3.- When the technician finishes R1 tell him to turn it on and continue with R1 verifications tab",br(),
                                                                                  
                                                                                  
                                                                                  
                                                                                  
                                                                                  ),
                                                                         
                                                                         tabPanel("R1 verifications",br(),
                                                                                  "When the technician finishes the installation of R1 you have to check 4 things
                                                                                  before you startt with the fail over process:",br(),
                                                                                  br(),
                                                                                  "1.- Check if the surface is getting power from the power cable (If the surface
                                                                                  is not connected it will go to sleep mode in 10 minutes).",br(),
                                                                                  "To check this you have to go to Restricted utilities (Look it on the STS tab), after that go to
                                                                                  display settings -  return to the windows main menu - On the search bar write battery - see if the battery is charging",br(),
                                                                                  br(),
                                                                                  "2.- Tell the technician to open the surface front part of the case and check if it has the following cables connected to it (those cables
                                                                                  come from the back part of the surface case)",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF13.png", 
                                                                                                width = "600", align ="left")),br(),
                                                                                  br(),
                                                                                  "3.- Ask the technician if all the cables connected to the dock have lights on them, the cables have to look like this:",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "surf4.png", 
                                                                                                width = 500, align ="left")),br(),
                                                                                  br(),
                                                                                  "If the tech tells you that there are no lights follow", tags$a(href = KB124564, style = "color:green", "KB124564"),br(),
                                                                                  br(),
                                                                                  "4.- Ask the tech the model of the receipt printer, if it is TM - T88V the tech should have a USB A to USB B cable (this model accepts this cable),
                                                                                  if the tech tell you that he has a TM - T88IV or TM - T88III, this printers only have a datacable port so we need the adapter for the surface",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF16.png", 
                                                                                                width = 500, align ="left")),br(),
                                                                                  br(),
                                                                                  
                                                                                  
                                                                                  "If you completed all this verifications you can now continue with the set up of the IP." 
                                                                                  
                                                                                  
                                                                                  
                                                                                  ),
                                                                         
                                                                         tabPanel("IP setup R1",
                                                                                  strong(h4("Important: You must restart the computer after the IP is set, omiting this will mess up the 
                                                                                            Fail Back process")),
                                                                                  tabsetPanel(type = "tab" ,
                                                                                              tabPanel("Old method",br(),
                                                                                                       "This steps are going to be done by the technician, we will guide the technician through it.",br(),
                                                                                                       br(),
                                                                                                       "1.- Open the main menu with ctrl + esc and select Restricted Utilities (RU) and give the tech the password of RU",br(),
                                                                                                       br(),
                                                                                                       "2.- Once the technician has access to RU ask him what is the title of the tool, if it is Restricted utilities V5.5.2.0 you can do the New method 
                                                                                                       (Faster & easier), if it only says Restricted utilities, you have to continue with the old method step 3.",br(),
                                                                                                       br(),
                                                                                                       "3.- Go to tools (option #5), select DOS prompt, this will open a command prompt.",br(),
                                                                                                       br(),
                                                                                                       "4.- On the CMD prompt input - " ,strong("runas /u:possvrsvc cmd"), " - password: " ,strong("p0$$vr$vc"), " (it will not appear but it is aplying the text), 
                                                                                                       this will open an administrator command prompt, please ask the tech if the administrator word is on the top of the CMD prompt window.",br(),
                                                                                                       br(),
                                                                                                       "5.- Input - " ,strong("ipconfig"), " - the following will appear:",br(),
                                                                                                       br(),
                                                                                                       fluidPage(img(src = "SF14.png", 
                                                                                                                     width = "600", align ="left")),br(),
                                                                                                       br(),
                                                                                                       "When the technician enters the ipconfig command, it is very important to verify the different “adapters” 
                                                                                                        that appear on the list, ONLY ONE of the adapters will show an IP ADDRESS, in the
                                                                                                       last picture we have the adapter called " ,strong("Ethernet Adapter Ethernet 2"), " each computer is different
                                                                                                       and it will appear with different names like " ,strong("Ethernet"), " or some other name, in the picture we have
                                                                                                       several adapters that start with " ,strong("Wireless LAN adapter"), " or " ,strong("Ethernet adapter"), ", from all of these
                                                                                                       we will only use the one that has an " ,strong("IP address"), ", once we locate the one with the ip address
                                                                                                       ,we will ask the technician to let us know the whole name of the adaptor.",br(),
                                                                                                       strong("Some of the adapters that has no IP ADDRESS will appear like “Media Disconnected” (green area)"),
                                                                                                       strong(style = "color:red", "VERY IMPORTANT NOT TO USE ANY OF THOSE ADAPTERS."),br(),
                                                                                                       br(),
                                                                                                       "6.- Access to store tech support so you can get the IP settings for register 1, the subnet mask & the gateway, we will use them for the 
                                                                                                       command on step 7",br(),
                                                                                                       br(),
                                                                                                       "7.- type -",strong(" netsh interface ipv4 set address name=“NetworkAdapterName” static ") ,strong(style= "color:green","10.XXX.XXX.11"), " " ,strong(style= "color:blue","255.255.255.224"), 
                                                                                                       " " ,strong(style= "color:red","10.XXX.XXX.1"),br(),
                                                                                                       " " ,strong(style = "color:green" ,"Green = IP R1"), " , " ,strong(style = "color:blue" ,"blue = subnet mask"), 
                                                                                                       ", " ,strong(style = "color:red" ,"red = gateway"), "",br(),
                                                                                                       "In this example the Network adapter name will be " ,strong("“Ethernet 2”"), ", this may change on your computer, remember to input the one on the
                                                                                                       ethernet adapter with the IP (previously explained), ",strong("We will never use “NetworkAdapterName” to set an IP."),br(),
                                                                                                       br(),
                                                                                                       "Posible Network adapter names:",br(),
                                                                                                       br(),
                                                                                                       "“Local Area connection”",br(),
                                                                                                       "“Local Area connection 2”",br(),
                                                                                                       "“Ethernet”",br(),
                                                                                                       "“Ethernet 2”",br(),
                                                                                                       br(),
                                                                                                       strong("Note: This are case sensitive"),br(),
                                                                                                       br(),
                                                                                                       "The technician may have some of the following", strong("errors:"),br(),
                                                                                                       br(),
                                                                                                       " ",strong("A) invalid address parameter"), "- There is no space between the first and second IP addresses and tech will need to put a space
                                                                                                       between those 2 to make it work.",br(),
                                                                                                       " ",strong("B) The filename, directory name or volume label syntax is incorrect"), "- In this specific error the technician forgot
                                                                                                       to use the quotation marks in the “NetworkAdapterName” to correct this he will need to type name=”Ethernet 2”",br(),
                                                                                                       "If there are no errors continue to step 8.",br(),
                                                                                                       br(),
                                                                                                       "8.- If the previous steps were followed correctly we should be able to remote to the register so we can input the next commands 
                                                                                                       (This depends of you, you can tell the technician the next commands as well so he inputs them).",br(),
                                                                                                       br(),
                                                                                                       "9.- input -",strong(" netsh interface ipv4 set dns name=”NetworkAdapterName” static "), strong(style = "color:red", "10.XXX.XXX.1"),br(),
                                                                                                       "This is the same as the gateway (that is why is red),it is called the DNS, after this is set nothing will happen but it will be set.",br(),
                                                                                                       br(),
                                                                                                       "10.- input -",strong(" netsh interface ipv4 add dns name=”NetworkAdapterName” addr=10.159.20.20 index=2"),br(),
                                                                                                       "This is the DNS 2 and it is the same for all registers on all GS stores.",br(),
                                                                                                       br(),
                                                                                                       "11.- Check if the register does ping (STS tab explains how to ping), Remote to the register (If you haven't), inject ctrl + esc - tools - get ip settings,
                                                                                                       If the window that pops up has the correct IP restart the computer. After the restart R1 should ask for the password to open RU of store XXXX, R1, if that is the case
                                                                                                       you are good to go to continue with the Fail Back process."
                                                                                                       
                                                                                                       
                                                                                                       
                                                                                                       
                                                                                                       
                                                                                                       
                                                                                              ),
                                                                                              
                                                                                              tabPanel("New method",br(),
                                                                                                       "This steps are going to be done by the technician, we will guide the technician through it.",br(),
                                                                                                       br(),
                                                                                                       "1.- Open the main menu with ctrl + esc and select Restricted Utilities (RU) Give the password to the tech",br(),
                                                                                                       br(),
                                                                                                       "2.- Once the technician has access to RU ask him what is the title of the tool, if it is Restricted utilities V5.5.2.0 you can do the New method 
                                                                                                       (Faster & easier), if it only says Restricted utilities, you have to set the IP with the old method",br(),
                                                                                                       br(),
                                                                                                       fluidPage(img(src = "SF15.png", 
                                                                                                                     width = "400", align ="left")),br(),
                                                                                                       br(),
                                                                                                       "3.- If this is the new restricted utilities you have to tell the tech to access to network (option #3), then go to set IP address and set the IP",br(),
                                                                                                       strong(style= "color:green","10.XXX.XXX.11 - R1 IP,"), strong(style= "color:blue","255.255.255.224 - Subnet mask,"), strong(style= "color:red","10.XXX.XXX.1 - Gateway,"),br(),
                                                                                                       br(),
                                                                                                       fluidPage(img(src = "IPR2.png", 
                                                                                                                     width = "600", align ="left")),br(),
                                                                                                       br(),
                                                                                                       "4.- Once the IP has been set you can remote to the register and input the DNS or tell the technician to input the DNS as well",br(),
                                                                                                       strong(style = "color:gray", "DNS1 = Same as gateway,"), strong(style = "color:orange", "DNS2 = 10.159.20.20"),br(),
                                                                                                       br(),
                                                                                                       "5.- Restart the computer after the IP has been set, after the restart R1 should ask for the password to open RU of store XXXX, R1 - if that is the case 
                                                                                                       you can continue with the Fail Back process"
                                                                                                       
                                                                                                       
                                                                                                       
                                                                                              )
                                                                                              
                                                                                  
                                                                                  
                                                                                  )
                                                                         ),
                                                                         
                                                                         
                                                                         
                                                                         
                                                                         tabPanel("Fail Back",br(),
                                                                                  h2("Disclaimer: For the FB you have to use OLD RU, Elevate Restricted Utilities is setting the IP address to .10 instead of .12", style = "color:red"),br(),
                                                                                  h3("To access to Old RU open a command prompt and input - restrictedutilities.exe - The following will open"),br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF49.png", 
                                                                                                width = "400", align ="left")),br(),
                                                                                  br(),
                                                                                  "1.- Close all the programs that are open on the register, normally the program open is back office, to close this 
                                                                                  open restricted utilities and then open the task manager and end the POS, R1 should be on the black screen, property of GameStop.",br(),
                                                                                  br(),
                                                                                  "2.- Turn R2 on and let it boot all the way up, normally it loads to the IPOS monitor, now end the IPOS monitor with task manager.",br(), 
                                                                                  "If it does not please end al tasks on R2 until it is on a black screen property of gamestop",br(),
                                                                                  br(),
                                                                                  "3.- On", strong("R2"), "open Restricted utilities and select the Fail Over Recovery Tool option, you will get the message
                                                                                  “Ready for Fail back”, and the following window",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF33.png", 
                                                                                                width = "400", align ="left")),br(),
                                                                                  br(),
                                                                                  "Click OK on the message",br(),
                                                                                  strong("NOTE:Only an unknown register and R1 (ER1) should appear on that screen, if something else appears please conact a mentor"),br(),
                                                                                  br(),
                                                                                  "4.- Click on the Fail Back button, if you get the remote registry error go to the tab “Common issues -> remote registry” if you don't, go 
                                                                                  to step 5",br(),
                                                                                  br(),
                                                                                  "5.- You will get the message “File Not copied”, click YES on the message only if you don't get an", strong(".MDB"),"file, if you see an .MDB file",
                                                                                  strong("Contact a mentor."),br(),
                                                                                  br(),
                                                                                  "6.- After that you will get a message “Fail Back Complete”, click OK, R1 will restart automatically, When R1 loads all the way to 
                                                                                  the POS R2 should restart, if it does not restart automatically just exit the Fail Over Recovery Tooland restart the computer manually",br(),
                                                                                  br(),
                                                                                  "7.- On R1 the register will be on back office, you have to close it with (ctrl + shift + z), R1 should be completely on a black screen"
                                                                                  
                                                                                  
                                                                                  
                                                                                  
                                                                                  ), 
                                                                         
                                                                         
                                                                         tabPanel("E-mail return",br(),
                                                                                  "1.- On your citrix desktop open a file explorer and remote to R1 with \\\\usa0XXX-1, access to the C drive POS\\Mail
                                                                                  cut the Inbox folder that is on the desktop (the one we cut before the Fail Over), and paste it on c:\\POS\\mail, replace the 
                                                                                  inbox folder that is already there with yours",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF34.png", 
                                                                                                width = "600", align ="left")),br(),
                                                                                  br(),
                                                                                  
                                                                                  
                                                                                  ),
                                                                         
                                                                         tabPanel("Pre force poll verifications",br(),
                                                                                  tabsetPanel(type = "tab",
                                                                                              tabPanel("Time setup",br(),
                                                                                                       h3(strong("You must perform this steps on R1 & R2")),
                                                                                 "1.- Open a command prompt, 
                                                                                  on the CMD prompt input - " ,strong("runas /u:possvrsvc cmd"), " - password: " ,strong("p0$$vr$vc"), " (it will not appear but it is aplying the text), 
                                                                                  this will open an administrator command prompt. ",br(),
                                                                                 br(),
                                                                                 
                                                                                 "2.- On the command prompt input the following: ", strong("Time"),br(),
                                                                                 "The following will appear: ",br(),
                                                                                 br(),
                                                                                 fluidPage(img(src = "SF45.png", 
                                                                                               width = "800", align ="left")),br(),
                                                                                 br(),
                                                                                 "3.- Ask the store employee to change the time and put the correct time." ,br(),
                                                                                 "They can input hour and munutes the seconds and miliseconds are not necessary",br(),
                                                                                 br(),
                                                                                 "4.- Input time again just to see if it did update, if it is upadted you can continue with the Forcepoll, if it is not try again."
                                                                                  
                                                                                  ),
                                                                                 tabPanel("AJBwaneps",br(),
                                                                                          h3(strong("You must perform this steps on R1 & R2")),
                                                                                          "1.- Open the new restricted utilities (ERU), you can do this with a command prompt - input - elevaterestrictedutilities.exe",br(),
                                                                                          "The following will appear:",br(),
                                                                                          br(),
                                                                                          fluidPage(img(src = "SF47.png", 
                                                                                                        width = "600", align ="left")),br(),
                                                                                          br(),
                                                                                          "2.- Select device manager, and the following pop up will appear",br(),
                                                                                          br(),
                                                                                          fluidPage(img(src = "SF46.png", 
                                                                                                        width = "600", align ="left")),br(),
                                                                                          br(),
                                                                                          strong("TIP: the window may appear on the right, you can move it to the left so you can see the selection arrow"),br(),
                                                                                          br(),
                                                                                          "3.- Click the arrow key and select automatic, then select start services",br(),
                                                                                          br(),
                                                                                          fluidPage(img(src = "SF48.png", 
                                                                                                        width = "600", align ="left")),br(),
                                                                                          br(),
                                                                                          "4.- open again the admin command prompt - input", strong("cd.."),
                                                                                          "and then <enter>, Now you should be on the c:\\ directory on the command prompt. (If we are not input cd.. until we 
                                                                                                                                                 are on the c:\\ folder)",br(),
                                                                                          br(),
                                                                                          "5.-  input - ",strong("schtasks.exe /Run /TN AJBConfigManager"), "and press <Enter>, you should get a message of SUCCESS
                                                                                                                                                 if not check the syntaxis maybe something is misspelled",br(),
                                                                                          br(),
                                                                                          "6.- Input - ", strong("net stop AJBwaneps "), " - wait 10 seconds", strong("net start AJBwaneps"),"wait 10 seconds",br(),
                                                                                          br(),
                                                                                          "7.- You can now do the force poll"
                                                                                          )
                                                                                 
                                                                                 
                                                                                 
                                                                                 )),
                                                                         
                                                                         
                                                                         
                                                                         tabPanel("Force Poll",br(),
                                                                                  "1.- On your Citrix desktop, go to the tools shortcut, open Devtools - Help Desk Approved tools - Reset security (Global)",
                                                                                  "open the program and input the number of your store - Example: if your store is store USA05555, input 5555, on the following messages just press
                                                                                  ok on both messages",br(),
                                                                                  br(),
                                                                                  "2.- Remote to R1 file explorer and access to c:\\poll\\receive, leave this window open while you perform step 3.",br(),
                                                                                  br(),
                                                                                  "3.- Go to the tools shortcut, open Devtools - Go to POSDown Archives - archives - You should now see a list of folders named by date in YYYYMMDD format 
                                                                                  (Ex: 20201220 = 20th Dic. 2020.) Sort by Date Modified so the newest is at the top, and select the day BEFORE the current date you’re needing to drop the files on",br(),
                                                                                  "Ex - If we are installing on the 4th of january of 2021 you have to open the file 20210103",br(),
                                                                                  "Now you should see a list of numbers, this are store numbers so if you are installing store 5555 you must select the 5555 folder,
                                                                                  enter to the folder and copy it's files to the folder you opened on step 2 c:\\poll\\receive",br(),
                                                                                  br(),
                                                                                  "4.- We have to do the same process fo the actual day of the installation, so for the previous example we would have to open the 20210104
                                                                                  copy it's files to the c:\\poll\\receive your folder should be like the following:",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF35.png", #imagen de C2S files con el c:\poll\receive
                                                                                                width = "800", align ="left")),br(),
                                                                                  br(),
                                                                                  "5.- Now that we have the C2S files and we performed the security reset we can now make a “Force Poll” ",br(),
                                                                                  "Now open Restricted Utilities - go to the remotelink option (#1) - and select the force poll option, leave the computer make all it's processes and wait 
                                                                                  until the computer closes all the programs",br(),
                                                                                  br(),
                                                                                  "6.- On restricted utilities go to option (utilities #2), access to the printers folder and select the printer driver as default (It can be either 
                                                                                  HP1_Mono (if the printer is connected via Wi-Fi or ethernet), or it can be the name of the printer(if it is connected via USB)",br(),
                                                                                  br(),
                                                                                  "7.- Restart the computer (when all the processes have finished) and now we can go to the Peripherals checkup step"

                                                                                  
                                                                                  
                                                                                  
                                                                                  ),
                                                                         
                                                                         
                                                                         
                                                                         
                                                                         tabPanel("Peripheral checkup",br(),
                                                                                  tabsetPanel(type = "tab",
                                                                                              tabPanel("General checkup",br(),
                                                                                                       "This check up is performed with the employee of the store, tell the tech that you need the employee so he can put him on the line.",br(),
                                                                                                       br(),
                                                                                                       "1.- After the restart R1 should boot all the way to the POS (Back office), you should have the following open.",br(),
                                                                                                       br(),
                                                                                                       fluidPage(img(src = "SF36.png", #imagen de back office sin re tech
                                                                                                                     width = "600", align ="left")),br(),
                                                                                                       br(),
                                                                                                       "2.- Tell the employee to open the register as normal, he will press F5 to open re tech and input the amount of money for the opening",br(),
                                                                                                       "If it does not open contact a mentor.",br(),
                                                                                                       br(),
                                                                                                       "3.- Tell the employee to open the e-mails and his performance portal (If they open it is working), if the emails or the performance are not opening
                                                                                                       please contact a mentor.",br(),
                                                                                                       br(),
                                                                                                       "4.- Tell the employee to check the reserves on reservation manager, he will open back office and select the reservation manager option, the reserves
                                                                                                       should appear on the window pop up (If they do not appear please contact a mentor)",br(),
                                                                                                       br(),
                                                                                                       "5.- Tell the employee to perform a transaction - here he will have to :",br(),
                                                                                                       "A) Scan something (This tells us if the Scanner works).",br(),
                                                                                                       "B) Check if the promotions are working (This will tell us if the C2S files were imported correctly).",br(),
                                                                                                       "C) Make a card balance (Here we check the pinpad), if it does not work go to the Specific Hardware TS tab.",br(),
                                                                                                       "D) Perform a customer lookup (This tells us if the information was traspassed correctly).",br(),
                                                                                                       "E) Perform a trade (To see if re tech works correctly).",br(),
                                                                                                       br(),
                                                                                                       "6.- Tell the employee to print a label with the label printer (If that does not work go to the Specific Hardware TS tab).",br(),
                                                                                                       br(),
                                                                                                       "7.- Tell the employee to print a report with the HP printer (If that does not work go to the Specific Hardware TS tab).",br(),
                                                                                                       br(),
                                                                                                       "8.- Tell the employee to check the counts, he will open back office, open the inventory and the press shift + F12
                                                                                                       (if it does not open contact a mentor).",br(),
                                                                                                       br(),
                                                                                                       "9.- Tell the employee to perform a no sale, (If that does not work go to the Specific Hardware TS tab).",br(),
                                                                                                       br(),
                                                                                                       "If everything works you can now repeat this process with R2 (If it is on the IPOS monitor just tell the user to open R2).",br(),
                                                                                                       "If you finished R1 & R2 you can now open all the other registers and tell the technician to sign his sign off sheet and you are done!!!!"
                                                                                                        ),
                                                                                              
                                                                                              tabPanel("Specific hardware TS",br(),
                                                                                                       tabsetPanel(type = "tab",
                                                                                                                   tabPanel("Pinpad",br(),
                                                                                                                            tabsetPanel(type = "tab",
                                                                                                                                        tabPanel("Unable to retrieve card balance at this time",br(),
                                                                                                                                                 fluidPage(img(src = "", #Error de la pinpad de re tech 
                                                                                                                                                               width = "600", align ="left")),br(),
                                                                                                                                                 br(),
                                                                                                                                                 "If you have this error you have to follow the next steps",br(),
                                                                                                                                                 br(),
                                                                                                                                                 "1.- Perform a card balance on the other installed register (it may be 1 or 2), if it works remote to the 
                                                                                                                                                 file explorer of the register that works and access the c:\\wansuppeps folder - copy the file called fipayeps_def.cfg and paste
                                                                                                                                                 it on the c:\\wansupeps folder of the register that was not working",br(),
                                                                                                                                                 "If it is not working on R1 or R2 please contact a mentor.",br(),
                                                                                                                                                 br(),
                                                                                                                                                 fluidPage(img(src = "SF37.png", 
                                                                                                                                                               width = "600", align ="left")),br(),
                                                                                                                                                 br(),
                                                                                                                                                 "2.- Open Restricted utilities and then select the option DOS prompt (Tools#5), input
                                                                                                                                                 -", strong("runas /u:possvrsvc cmd - PW:p0$$vr$vc")," so you can open an admin command prompt.",br(),
                                                                                                                                                 br(),
                                                                                                                                                 "3.- On the command prompt input", strong("cd.."),
                                                                                                                                                 "and then <enter>, Now you should be on the c:\\ directory on the command prompt. (If we are not input cd.. until we 
                                                                                                                                                 are on the c:\\ folder)",br(),
                                                                                                                                                 br(),
                                                                                                                                                 "4.- now input - ",strong("schtasks.exe /Run /TN AJBConfigManager"), "and press <Enter>, you should get a message of SUCCESS
                                                                                                                                                 if not check the syntaxis maybe something is misspelled",br(),
                                                                                                                                                 br(),
                                                                                                                                                 "5.- Input - ", strong("net stop AJBwaneps "), " - wait 10 seconds", strong("net start AJBwaneps"),br(),
                                                                                                                                                 br(),
                                                                                                                                                 "6.- Close re tech (Alt + F4) - re open it (F5) and test the pinpad",br(),
                                                                                                                                                 "If it does not work please contact a mentor"
                                                                                                                                                 
                                                                                                                                                 
                                                                                                                                                 
                                                                                                                                                 ),
                                                                                                                                        
                                                                                                                                        tabPanel("Unable to initialize authorization",br(),
                                                                                                                                                 fluidPage(img(src = "", #Error de la pinpad de re tech 
                                                                                                                                                               width = "600", align ="left")),br(),
                                                                                                                                                 br(),
                                                                                                                                                 "If you have the message “Unable to initialize authorization components
                                                                                                                                                 credit, debit, gift and POSA authorization may not work correctly. Please contact 
                                                                                                                                                 heñp desk inmediatelty”, you have to follow the next steps.",br(),
                                                                                                                                                 br(),
                                                                                                                                                 "1.- Open Restricted utilities and then select the option DOS prompt (Tools#5), input
                                                                                                                                                 -", strong("runas /u:possvrsvc cmd - PW:p0$$vr$vc")," so you can open an admin command prompt.",br(),
                                                                                                                                                 br(),
                                                                                                                                                 "2.- On the admin prompt input -", strong("Net stop ajbwaneps"), "wait 5 seconds and input",
                                                                                                                                                 strong("Net start ajbwaneps."),br(),
                                                                                                                                                 br(),
                                                                                                                                                 "3.- Now close retech (alt + F4) and run it again (F5), if the issue persist go to step 4.",br(),
                                                                                                                                                 br(),
                                                                                                                                                 "4.- If the issue persisted close R1 & R2 (black screen property of GS), and perform a force poll on R1,",br(),
                                                                                                                                                 "To make this you have to open RU, go to the remote link option (#1), and select force poll.",br(),
                                                                                                                                                 br(),
                                                                                                                                                 "5.- If that does not work contact a mentor."
                                                                                                                                                 
                                                                                                                                                 )
                                                                                                                                        
                                                                                                                                        
                                                                                                                                        )
                                                                                                                            ),
                                                                                                                   
                                                                                                                   
                                                                                                                   tabPanel("Receipt printer",br(),
                                                                                                                            tabsetPanel(type = "tab",
                                                                                                                                        tabPanel("Driver installation (Only for data to USB adapters)/Offline",br(),
                                                                                                                                                 "If your receipt printer is connected with an adapter you have to install the driver for the receipt
                                                                                                                                                 printer to work",br(),
                                                                                                                                                 br(),
                                                                                                                                                 fluidPage(img(src = "SF16.png", 
                                                                                                                                                               width = 500, align ="left")),br(),
                                                                                                                                                 br(),
                                                                                                                                                 "1.- Open restricted utilities and go to option utilities (#2), select device manager, if you have 
                                                                                                                                                 a device on the tab  “Other devices” that says USB-Serial Controller D then you will have to continue to step 2,
                                                                                                                                                 if you don't have that the issue is not the driver, try other TS",br(),
                                                                                                                                                 br(),
                                                                                                                                                 "2.- On the citrix desktop go to the tools shortcut - DEVtools - Help desk approved tools, you should have the following open",br(),
                                                                                                                                                 br(),
                                                                                                                                                 fluidPage(img(src = "SF38.png", 
                                                                                                                                                               width = 700, align ="left")),br(),
                                                                                                                                                 br(),
                                                                                                                                                 "3.- Open the file explorer and remote to the register that needs the driver, access to the c:\\packages, folder",br(),
                                                                                                                                                 br(),
                                                                                                                                                 "4.- Copy the driver TU-S9 to the c:\\packages of the register in question, you should have something like this:",br(),
                                                                                                                                                 br(),
                                                                                                                                                 fluidPage(img(src = "SF39.png", 
                                                                                                                                                               width = 900, align ="left")),br(),
                                                                                                                                                 br(),
                                                                                                                                                 "5.- Open Restricted utilities and then select the option DOS prompt (Tools#5), input
                                                                                                                                                 -", strong("runas /u:possvrsvc cmd - PW:p0$$vr$vc")," so you can open an admin command prompt.",br(),
                                                                                                                                                 br(),
                                                                                                                                                 "6.- On the admin prompt input c:\\packages\\tu-s9 /x , this will open a window that intsalls the driver, select OK % Yes on everything that pops up",br(),
                                                                                                                                                 br(),
                                                                                                                                                 "7.- Click the receipt printer Icon twice (the one on the top right corner of retech)",br(),
                                                                                                                                                 br(),
                                                                                                                                                 "8.- If the icon is light up, perform a no sale, if it still does not work go to the “Change port number tab” "
                                                                                                                                                 
                                                                                                                                                 
                                                                                                                                                 ),
                                                                                                                                        
                                                                                                                                        tabPanel("Change port number",br(),
                                                                                                                                                 "This TS is performed when the receipt printer is offline and you already tried the driver TS or yout printer is connected with a normal USB cable",br(),
                                                                                                                                                 br(),
                                                                                                                                                 "1.- Open restricted utilities, go to utilities (#2), select device manager and open the PORTS (COM & LPT) tab",br(),
                                                                                                                                                 br(),
                                                                                                                                                 "2.- If you see a COM port that is over COM 4 (5,6,7...), select that port and click it twice, the following window should appear",br(),
                                                                                                                                                 br(),
                                                                                                                                                 fluidPage(img(src = "", #COM device manager window
                                                                                                                                                               width = 600, align ="left")),br(),
                                                                                                                                                 br(),
                                                                                                                                                 "3.- On that window go to Port settings and select advanced, a new window will open: ",br(),
                                                                                                                                                 br(),
                                                                                                                                                 fluidPage(img(src = "SF41.png", #COM device manager window pt2
                                                                                                                                                               width = 600, align ="left")),br(),
                                                                                                                                                 br(),
                                                                                                                                                 
                                                                                                                                                 "4.- In this window we need to click on the COM Port Number area and we will get a dropdown menu,
                                                                                                                                                 once it opens we need to select the lowest COM port available that is ",strong(style = "COLOR:RED","NOT IN USE"),"
                                                                                                                                                 we will press OK",br(),
                                                                                                                                                 
                                                                                                                                                 br(),
                                                                                                                                                 fluidPage(img(src = "SF40.png", #COM device manager window pt3
                                                                                                                                                               width = 500, align ="left")),br(),
                                                                                                                                                 br(),
                                                                                                                                                 "5.- Press OK on the previous window and we will restart the affected register after it loads we
                                                                                                                                                 will test it one more time doing a NO SALE, if it doesn’t work contact a mentor",br(),
                                                                                                                                                
                                                                                                                                                    
                                                                                                                                                    )
                                                                                                                                        )
                                                                                                                            
                                                                                                                            ),
                                                                                                                   
                                                                                                                   
                                                                                                                   tabPanel("Label printer",br(),
                                                                                                                            tabsetPanel(type = "tab",
                                                                                                                                        tabPanel("Driver installation / LP2824",br(),
                                                                                                                                                 "If your Label printer is connected with an adapter you have to install the driver for it
                                                                                                                                                 to work",br(),
                                                                                                                                                 "Only the LP2824 has a serial port so if your store has a ZD410 you do not need this steps to fix the issue",br(),
                                                                                                                                                 br(),
                                                                                                                                                 fluidPage(img(src = "SF16.png", 
                                                                                                                                                               width = 500, align ="left")),br(),
                                                                                                                                                 br(),
                                                                                                                                                 "1.- Open restricted utilities and go to option utilities (#2), select device manager, if you have 
                                                                                                                                                 a device on the tab  “Other devices” that says USB-Serial Controller D then you will have to continue to step 2,
                                                                                                                                                 if you don't have that the issue is not the driver, try other TS",br(),
                                                                                                                                                 br(),
                                                                                                                                                 "2.- On the citrix desktop go to the tools shortcut - DEVtools - Help desk approved tools, you should have the following open",br(),
                                                                                                                                                 br(),
                                                                                                                                                 fluidPage(img(src = "SF38.png", 
                                                                                                                                                               width = 700, align ="left")),br(),
                                                                                                                                                 br(),
                                                                                                                                                 "3.- Open the file explorer and remote to the register that needs the driver, access to the c:\\packages, folder",br(),
                                                                                                                                                 br(),
                                                                                                                                                 "4.- Copy the driver TU-S9 to the c:\\packages of the register in question, you should have something like this:",br(),
                                                                                                                                                 br(),
                                                                                                                                                 fluidPage(img(src = "SF39.png", 
                                                                                                                                                               width = 900, align ="left")),br(),
                                                                                                                                                 br(),
                                                                                                                                                 "5.- Open Restricted utilities and then select the option DOS prompt (Tools#5), input
                                                                                                                                                 -", strong("runas /u:possvrsvc cmd - PW:p0$$vr$vc")," so you can open an admin command prompt.",br(),
                                                                                                                                                 br(),
                                                                                                                                                 "6.- On the admin prompt input c:\\packages\\tu-s9 /x , this will open a window that intsalls the driver, select OK % Yes on everything that pops up",br(),
                                                                                                                                                 br(),
                                                                                                                                                 "7.- Press ctrl + escape - tools - restart labels, and try to print a label, if it does not print go to step 8",br(),
                                                                                                                                                 br(),
                                                                                                                                                 "8.-If it does not print try disconnecting the printer and connecting it back. restart labels and try to print, if it does not work please contact a mentor "
                                                                                                                                                 
                                                                                                                                                 )
                                                                                                                                        
                                                                                                                                        )
                                                                                                                            ),
                                                                                                                   
                                                                                                                   
                                                                                                                   tabPanel("Report printer",br(),
                                                                                                                            
                                                                                                                            tabsetPanel(type = "tab",
                                                                                                                                        tabPanel("Surface printer sharing",br(),
                                                                                                                                                 "LVL 2 told us that there is an ETA to share the USB drivers form the surface computer",br(),
                                                                                                                                                 "The only workaround is basically to connect the printer via Wireless and select HP1_mono on all registers",br(),
                                                                                                                                                 "If it is connected via USB only one surface will be able to print"
                                                                                                                                                                              
                                                                                                                                                 
                                                                                                                                                 
                                                                                                                                                 ),
                                                                                                                                        
                                                                                                                                        
                                                                                                                                        tabPanel("Other issues",br(),
                                                                                                                                                 "Please go to the peripheral tab on the menu and select the printer that needs to be TS"
                                                                                                                                                 
                                                                                                                                                 )
                                                                                                                                        )
                                                                                                                            )
                                                                                                                   
                                                                                                                   
                                                                                                                   
                                                                                                                   )
                                                                                                       
                                                                                                       
                                                                                                       )
                                                                                              
                                                                                              
                                                                                              
                                                                                              )
                                                                                  
                                                                                  
                                                                                  )
                                                                         
                                                                         
                                                                         )
                                                             
                                                             
                                                             
                                                             ),
                                                    
                                                    
                                                    
                                                    
                                                    tabPanel("Common issues",br(),
                                                             tabsetPanel(type = "tab",
                                                                         tabPanel("KB´s",
                                                                                   h3("Click on the KB to go directly to it on SNOW!!"),br(),
                                                             
                                                             
                                                                                  tags$a(href = KB124759, style = "color:green", "KB124759"),
                                                                                  "<- How To - Unlock an Upside-Down Surface Pro Tablet from The Rapid Dock", br(),
                                                                                  br(),
                                                                                  tags$a(href = KB123793, style = "color:green", "KB123793"),
                                                                                  "<- General Surface Pro installation support",br(),
                                                                                  br(),
                                                                                  tags$a(href = KB124564, style = "color:green", "KB124564"),
                                                                                  "<- Surface Pro is not recognizing USB devices"
                                                             
                                                                                  ),
                                                                         
                                                                         
                                                             tabPanel("Remote Registry",br(),
                                                                      fluidPage(img(src = "RREG1.png", 
                                                                                    width = "500", align ="left")),br(),
                                                                      br(),
                                                                      "If you get the remote registry error on the Fail over or the Fail back part you have to follow this steps",br(),
                                                                      br(),
                                                                      strong("Note: On the fail back we have to do this on R1 & R2"),br(),
                                                                      br(),
                                                                      "1.- On restricted utilities select option tools (#5), and the open a DOS prompt",br(),
                                                                      br(),
                                                                      "2.- Input - ",strong("runas /u:possvrsvc cmd - PW:p0$$vr$vc"),"(the password will not type but it is being input)",br(),
                                                                      br(),
                                                                      "3.- On the new command input service.msc, select remote registry and click enter",br(),
                                                                      br(),
                                                                      "4.- On startup type select manual -> select apply -> select start",br(),
                                                                      br(),
                                                                      fluidPage(img(src = "RREG2.png", 
                                                                                    width = "700", align ="left")),br(),
                                                                      br(),
                                                                      "5.- Now you can continue with the Fail back, ",strong("if the issue persists you have to perform this steps on the other
                                                                      register,")," if the issue persist please contact a mentor"
                                                                      
                                                                      
                                                                      
                                                                      )
                                                             
                                                             
                                                             )
                                                             
                                                             
                                                    ))
                                ),
                                
                                tabItem(tabName = "surfacesd",
                                        
                                        img(
                                          src = "https://upload.wikimedia.org/wikipedia/commons/d/d0/RStudio_logo_flat.svg", 
                                          height = 45, width = 50, align ="right"),
                                        h1("Service desk guide for the surface"),strong("Info. provided by Enrique Escobedo & Raúl Blé"),br(),
                                        br(),
                                        tabsetPanel(type = "tab",
                                                    
                                                    tabPanel("How does it look?",br(),
                                                             tabsetPanel(type = "tab",
                                                                         tabPanel("Front",br(),
                                                                                  fluidPage(img(src = "surf1.png", 
                                                                                                width = 600, align ="left")),br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "surf2.png", 
                                                                                                width = 600, align ="left")),br(),
                                                                                  
                                                                                  br(),
                                                                                  fluidPage(img(src = "surf7.png", 
                                                                                                width = 600, align ="left")),br(),),
                                                                         
                                                                         tabPanel("Back",br(),
                                                                                  fluidPage(img(src = "surf6.png", 
                                                                                                width = 600, align ="left")),br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "surf8.png", 
                                                                                                width = 600, align ="left")),br(),
                                                                                  
                                                                         ),
                                                                         
                                                                         tabPanel("Case no surface",br(),
                                                                                  fluidPage(img(src = "SF50.png", 
                                                                                                width = 900, align ="left")),br(),
                                                                                  
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF53.png", 
                                                                                                width = 600, align ="left")),br(),
                                                                                  br(),
                                                                                           
                                                                                  ),
                                                                         
                                                                         tabPanel("Surface cables",
                                                                                  br(),
                                                                                  
                                                                                  fluidPage(img(src = "SF52.png", 
                                                                                                width = 700, align ="left")),br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF51.png", 
                                                                                                width = 900, align ="left")),br(),
                                                                                  br(),
                                                                                  
                                                                                  ),
                                                                         
                                                                         tabPanel("Dock cables",br(),
                                                                                  fluidPage(img(src = "surf4.png", 
                                                                                                width = 600, align ="left")),br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "surf5.png", 
                                                                                                width = 600, align ="left")),br(),
                                                                         )
                                                                         
                                                                         
                                                             )
                                                             
                                                             
                                                             
                                                             
                                                             
                                                             
                                                    ),
                                                    
                                                    
                                                    tabPanel("Kronos schedule planner",br(),
                                                             
                                                          strong("Issue:"),  "On the new surfaces the kronos schedule planer cannot be displayed if the user opens the app on the 
                                                             OKTA dashboard",br(),
                                                          br(),
                                                          "It looks like the following if the user opens it from the OKTA dashboard.",br(),
                                                          
                                                          br(),
                                                          fluidPage(img(src = "Kronos schedule.png",
                                                                        width = "800", align ="center")),br(),
                                                          br(),
                                                          strong("Workaround:"),"Open kronos from back office (option F12), the back office version of kronos is able to display all the 
                                                          schedule planer GUI",br(),
                                                          br(),
                                                          fluidPage(img(src = "How it should be (R3).png",
                                                                        width = "800", align ="left")),br(),
                                                          
                                                             
                                                             
                                                             ),
                                                    
                                                    tabPanel("Unable to open support chat",br(),
                                                             
                                                             strong("Issue:"), "The users are not able to open the support chat from the dashboard when they click it",br(),
                                                             br(),
                                                             fluidPage(img(src = "SF55.png",
                                                                           br(),
                                                                           width = "400", align ="center")),br(),
                                                             
                                                             strong("Workaround: "),"Open the chat on the main menu (ctrl + esc) - shortcuts - store tech support",br(),
                                                             br(),
                                                             fluidPage(img(src = "SF54.png",
                                                                           width = "500", align ="left")),br(),
                                                             
                                                             
                                                             ),
                                                    
                                                    tabPanel("FAQ",
                                                             
                                                             h2("Frequently asked questions"),br(),
                                                             strong("Q: Can we send a technician to the store to make cable management after the installation?"),br(),
                                                             "A: No, the technicians only go to the store to set the boards and pinpad holes on the store
                                                             the user is able to change a broken dock or a broken surface",br(),
                                                             br(),
                                                             strong("Q: There are two bars on the sides of the tablet, can I make them dissapear"),br(),
                                                             "A: Not at the moment, LVL 3 is making an updated version of retech so it can fit the aspect to body ratio of the surface",br(),
                                                             br(),
                                                             strong("Q: How do I soft reboot the surface"),br(),
                                                             "A: Click on the power button + volume up button for 30 seconds (buttons located on the top left of the surface)",br(),
                                                             br(),
                                                             strong(""),br(),
                                                             strong(""),br(),
                                                             
                                                             ),
                                                    
                                                    tabPanel("KB's",br(),
                                                            h3("Click on the KB to go directly to it on SNOW!!"),br(),                                                                                  
                                                              tags$a(href = KB124759, style = "color:green", "KB124759"),
                                                              "<- How To - Unlock an Upside-Down Surface Pro Tablet from The Rapid Dock", br(),
                                                              br(),
                                                              tags$a(href = KB123793, style = "color:green", "KB123793"),
                                                              "<- General Surface Pro installation support",br(),
                                                              br(),
                                                              tags$a(href = KB124564, style = "color:green", "KB124564"),
                                                              "<- Surface Pro is not recognizing USB devices"
                                                                                  
                                                              )
                                                    
                                                    
                                                    
                                                    )
                                        
                                        
                                        ),
                                
                                
                                
                                
                                
                                
                                tabItem(tabName = "fort",
                                        img(
                                            src = "https://upload.wikimedia.org/wikipedia/commons/d/d0/RStudio_logo_flat.svg", 
                                            height = 45, width = 50, align ="right"),
                                        h1("Fail Over Recovery Tool (FORT)"),
                                        tabsetPanel(type = "tab",
                                                    tabPanel("What is FORT?",br(),
                                                             "The Fail Over Recovery Tool helps us with the transfer of information between R1 & R2 in case that R1 stops working",br(),
                                                             br(),
                                                             "But a little bit of context first",br(),
                                                             "The stores have from 2 registers up to 9 registers, but R1 manages all the server connection with GS corporate",br(),
                                                             "With that said if R1 does not work, the entire store is unable to operate",br(),
                                                             br(),
                                                             "That is where the FORT process takes place, with it we can make an aux register (preferrably R2) an emergency R1 that will 
                                                             connect to the GS servers.",br(),
                                                             "The Emergency R1 (ER1) serves as a temporary R1 that will allow the store to communicate with the GS server and 
                                                             be able to perform sales and be operational until the new R1 arrives",br(),
                                                             br(),
                                                             "FORT allows us to perform two processes, the Fail Over & the Fail back (Explained in the following tabs)",br(),
                                                             "The following is an image of the FORT tool",br(),
                                                             br(),
                                                             fluidPage(img(src = "SF32.png", 
                                                                           width = "500", align ="left")),br(),
                                                             ),
                                                    tabPanel("Fail over",br(),
                                                             tabsetPanel(type = "tabs",
                                                                         tabPanel("What is it & When does it apply?",br(),
                                                                                  strong("What is it?"),br(),
                                                                                  "The Fail Over process is basically the counterpart of the Fail Back",br(),
                                                                                  "It makes R2 an emergency register so the store can actually continue with their sales ",br(),
                                                                                  br(),
                                                                                  strong("When does it apply?"),br(),
                                                                                  "It applies when R1 dies and we need to make R2 an ER1"
                                                                         ),
                                                                         
                                                                         tabPanel("Checks before starting",br(),
                                                                                  h2("Obligatory checks before performing the FO", style ="color:red"),br(),
                                                                                  strong("1.- DO NOT RUN DBBACKUP ON REGISTER 2, EVER.",br(),
                                                                                         br(),
                                                                                        "2.- Only R2 has to be on since R1 is not operational",br(),
                                                                                         br(),
                                                                                         "3.- R2 has to be on the property of gamestop black screen (All POS apps closed)",br(),
                                                                                         br(),
                                                                                         "4.- R2 has to be a real R2 not an ER1 (you can check that in c:\\bak - if there is a file called
                                                                                         emergenc.flg that means that the register is an emergency register)",br(),
                                                                                         br(),
                                                                                         "5.- The store has an stable internet connection - in case it does not please perform a L1 triage"),
                                                                                  ),
                                                                         
                                                                         
                                                                         
                                                                         tabPanel("FORT access",br(),
                                                                                  "To access to FORT we need Restricted Utilities (RU),",br(),
                                                                                  "To open RU you need the password generator. Open it on your desktop, under the tools shortcut on the 
                                                                                   right side of the screen. Once it opens, we will select the folder named Tools-Shortcut and then we will right click
                                                                                   the POS PasswordGenerator program, so we can ",strong("Run as administrator."),"If you do not
                                                                                   have the folder you can open the RUN application and type \\\\gvfile1\\IS\\HelpDesk\\Tools",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF17.png", #Foto de la desktop, 
                                                                                                width = "600", align ="left")),br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF18.png", #Foto de PW generator, 
                                                                                                width = "400", align ="left")),br(),
                                                                                  br(),
                                                                                  "On the register press ctrl + esc (it has to be inyected on TRC) and select Restricted utilities on the menu",br(),
                                                                                  "Where it says Enter Store # we will input the 4 digits of the store (or less if store has less number),
                                                                                   and on Enter Reg. # we will input the register we are working with.",strong("In case that the date does not match the current day,
                                                                                                                                         we will change it by pressing Change Date and
                                                                                                                                         select the date technician provide us"), strong(style = "color:red", 
                                                                                                                                         "THIS ONLY WORKS IF IT WAS RUN AS ADMIN."),br(),
                                                                                  br(),
                                                                                  "Once we input the password now we have access to" ,strong("RU"),br(),
                                                                                  br(),
                                                                                  "Go to to tools(#5) - Fail over recovery tool",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF49.png", 
                                                                                                width = "400", align ="left")),br(),
                                                                                  br(),
                                                                                  "and FORT will open",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF32.png", 
                                                                                                width = "500", align ="left")),
                                                                                  ),
                                                                         
                                                                         tabPanel("Fail over",br(),
                                                                                  "Once you are in FORT the following should appear",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "FO1.png", 
                                                                                                width = "500", align ="left")),br(),
                                                                                  br(),
                                                                                  strong("If the message does not appear R1 might still be on, shut it down"),br(),
                                                                                  "Click on the Fail over button and the following message “Fail over to secondary” should appear, click yes and the fail over will begin ",br(),
                                                                                  strong("If you get the REMOTE REGISTRY ERROR, please go to the error tab on top of this web page and follow those steps"),br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "FO2.png", 
                                                                                                width = "500", align ="left")),br(),
                                                                                  br(),
                                                                                  strong("Disclaimer: If you see an old backup file that does not display the correct information of when the register 1 went down, 
                                                                                      reach out to the Store Tech Support Level 2 Escalation team IMMEDIATELY. Do Not continue with the Fail Over Process below.",br(),
                                                                                      "Example: Register 1 failed on during the evening closing of 4/29/2021, 
                                                                                      but the backup file is dated for 4/15/2021 or older. Please note this is just an example, the date/time may vary."),br(),
                                                                                  br(),
                                                                                  " Then another message called “Verify missing Backup File” will appear",br(),
                                                                                  "As long as there is not any file with the extension", strong(".MDB"), "you can continue, if there is a file with an .MDB extension",strong("Please contact a lead or LVL 2"),br(),
                                                                                  "After we clicked on YES, R2 will change it's name to R1 and the IP address will change to .11",br(),
                                                                                  br(),
                                                                                  "R2 now is called Emergency R1 (ER1), we have to remote to ER1 with the IP address of R1",br(),
                                                                                  br(),
                                                                                  "The message “Fail over complete” will appear, select OK on the message and ER1 will restart",br(),
                                                                                  br(),
                                                                                  "After the restart remote to ER1, it should load all the way to the POS (back office and the menu), close back office (ctrl + shift + z - F5)
                                                                                  the computer should be on a black screeen, property of gamestop should be on the background.",br(),
                                                                                  br(),
                                                                                  "The Fail Over is completed, we need to do some more steps to be sure that the registers are fully functional."
                                                                                  
                                                                                  
                                                                                  ),
                                                                         
                                                                         
                                                                         
                                                                         tabPanel("AJBwaneps activation",br(),
                                                                                 
                                                                                  "1.- Open the new restricted utilities (ERU), you can do this with a command prompt - input - elevaterestrictedutilities.exe",br(),
                                                                                  "The following will appear:",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF47.png", 
                                                                                                width = "600", align ="left")),br(),
                                                                                  br(),
                                                                                  "2.- Select device manager, and the following pop up will appear",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF46.png", 
                                                                                                width = "600", align ="left")),br(),
                                                                                  br(),
                                                                                  strong("TIP: the window may appear on the right, you can move it to the left so you can see the selection arrow"),br(),
                                                                                  br(),
                                                                                  "3.- Click the arrow key and select automatic, then select start services",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF48.png", 
                                                                                                width = "600", align ="left")),br(),
                                                                                  br(),
                                                                                  "4.- open again the admin command prompt - input", strong("cd.."),
                                                                                  "and then <enter>, Now you should be on the c:\\ directory on the command prompt. (If we are not input cd.. until we 
                                                                                                                                                 are on the c:\\ folder)",br(),
                                                                                  br(),
                                                                                  "5.-  input - ",strong("schtasks.exe /Run /TN AJBConfigManager"), "and press <Enter>, you should get a message of SUCCESS
                                                                                                                                                 if not check the syntaxis maybe something is misspelled",br(),
                                                                                  br(),
                                                                                  "6.- Input - ", strong("net stop AJBwaneps "), " - wait 10 seconds", strong("net start AJBwaneps"),"wait 10 seconds",br(),
                                                                                  br(),
                                                                                  "7.- You can now do the force poll"
                                                                                  ),
                                                                         
                                                                        
                                                                         
                                                                         tabPanel("Force poll",br(),
                                                                                  "1.- On your Citrix desktop, go to the tools shortcut, open Devtools - Help Desk Approved tools - Reset security (Global), or in the search bar look for \\\\gvfile1\\IS\\HelpDesk\\Tools\\DEVTools\\Help Desk Approved Tools",
                                                                                  ",open the program and input the number of your store - Example: if your store is store USA05555, input 5555, on the following messages just press
                                                                                  ok on both messages",br(),
                                                                                  br(),
                                                                                  "2.- Remote to R1 file explorer and access to c:\\poll\\receive, leave this window open while you perform step 3.",br(),
                                                                                  br(),
                                                                                  "3.- Go to the tools shortcut, open Devtools - Go to POSDown Archives - archives - You should now see a list of folders named by date in YYYYMMDD format 
                                                                                  (Ex: 20201220 = 20th Dic. 2020.) Sort by Date Modified so the newest is at the top, and select the day BEFORE the current date you’re needing to drop the files on",br(),
                                                                                  "Ex - If we are installing on the 4th of january of 2021 you have to open the file 20210103",br(),
                                                                                  "Now you should see a list of numbers, this are store numbers so if you are installing store 5555 you must select the 5555 folder,
                                                                                  enter to the folder and copy it's files to the folder you opened on step 2 c:\\poll\\receive",br(),
                                                                                  br(),
                                                                                  "4.- We have to do the same process fo the actual day of the installation, so for the previous example we would have to open the 20210104
                                                                                  copy it's files to the c:\\poll\\receive your folder should be like the following:",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF35.png", #imagen de C2S files con el c:\poll\receive
                                                                                                width = "800", align ="left")),br(),
                                                                                  br(),
                                                                                  "5.- Now that we have the C2S files and we performed the security reset we can now make a “Force Poll” ",br(),
                                                                                  "Now open Restricted Utilities - go to the remotelink option (#1) - and select the force poll option, leave the computer make all it's processes and wait 
                                                                                  until the computer closes all the programs",br(),
                                                                                  br(),
                                                                                  "6.- On restricted utilities go to option (utilities #2), access to the printers folder and select the printer driver as default (It can be either 
                                                                                  HP1_Mono (if the printer is connected via Wi-Fi or ethernet), or it can be the name of the printer(if it is connected via USB)",br(),
                                                                                  br(),
                                                                                  "7.- Restart the computer (when all the processes have finished) and now we can go to the Peripherals checkup step"
                                                                                  ),
                                                                         
                                                                         tabPanel("Peripheral checkup",br(),
                                                                                           "This check up is performed with the employee of the store, tell the tech that you need the employee so he can put him on the line.",br(),
                                                                                           br(),
                                                                                           "1.- After the restart ER1 should boot all the way to the POS (Back office), you should have the following open.",br(),
                                                                                           br(),
                                                                                           fluidPage(img(src = "SF36.png", #imagen de back office sin re tech
                                                                                                         width = "600", align ="left")),br(),
                                                                                           br(),
                                                                                           "2.- Tell the employee to open the register as normal, he will press F5 to open re tech and input the amount of money for the opening.",br(),
                                                                                           "If it does not open try TS the problem in hand as normal, if you cannot fix it contact lvl 2 or a LEAD .",br(),
                                                                                           br(),
                                                                                           "3.- Tell the employee to open the e-mails and his performance portal (If they open it is working), if the emails or the performance are not opening
                                                                                                       please try the following.",br(),
                                                                                           "Open c:\\POS\\Emails\\inbox - cut all the files in that folder and copy them into a new folder created on your citrix desktop",br(),
                                                                                           "When all the files are now on the new folder cut them again and copy them in the InBox folder of the register (this is an e mail refresh)",br(),
                                                                                           "If that does not work please contact a LEAD or LVL 2",br(),
                                                                                           br(),
                                                                                           "4.- Tell the employee to check the reserves on reservation manager, he will open back office and select the reservation manager option, the reserves
                                                                                                       should appear on the window pop up (If they do not appear please contact a LEAD or LVL 2)",br(),
                                                                                           br(),
                                                                                           "5.- Tell the employee to perform a transaction - here he will have to :",br(),
                                                                                           "A) Scan something (This tells us if the Scanner works).",br(),
                                                                                           "B) Check if the promotions are working (This will tell us if the C2S files were imported correctly).",br(),
                                                                                           "C) Make a card balance (Here we check the pinpad), if it does not work go to the Specific Hardware TS tab.",br(),
                                                                                           "D) Perform a customer lookup (This tells us if the information was traspassed correctly).",br(),
                                                                                           "E) Perform a trade (To see if re tech works correctly).",br(),
                                                                                           br(),
                                                                                           "6.- Tell the employee to print a label with the label printer (If that does not work TS accordingly with KB´s.)",br(),
                                                                                           br(),
                                                                                           "7.- Tell the employee to print a report with the HP printer (If that does not work TS accordingly with KB´s.).",br(),
                                                                                           br(),
                                                                                           "8.- Tell the employee to check the counts, he will open back office, open the inventory and the press shift + F12
                                                                                                       (if it does not open contact a LEAD or LVL 2).",br(),
                                                                                           br(),
                                                                                           "9.- Tell the employee to perform a no sale, (If that does not work TS accordingly with KB´s.).",br(),
                                                                                           br(),
                                                                                           "If everything works you can now tell the user to turn all his auxiliary registers on",br(),
                                                                                           "At this point you should have sent a new R1 to the store and they will receive it to perform a Fail Back"
                                                                                           ),
                                                                         
                                                                         
                                                                         tabPanel("Remote Registry (only if necessary)",br(),
                                                                                  fluidPage(img(src = "RREG1.png", 
                                                                                                width = "500", align ="left")),br(),
                                                                                  br(),
                                                                                  "If you get the remote registry error on the Fail over or the Fail back part you have to follow this steps",br(),
                                                                                  br(),
                                                                                  strong("Note: On the fail back we have to do this on R1 & R2"),br(),
                                                                                  br(),
                                                                                  "1.- On restricted utilities select option tools (#5), and the open a DOS prompt",br(),
                                                                                  br(),
                                                                                  "2.- Input - ",strong("runas /u:possvrsvc cmd - PW:p0$$vr$vc"),"(the password will not type but it is being input)",br(),
                                                                                  br(),
                                                                                  "3.- On the new command input service.msc, select remote registry and click enter",br(),
                                                                                  br(),
                                                                                  "4.- On startup type select manual -> select apply -> select start",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "RREG2.png", 
                                                                                                width = "700", align ="left")),br(),
                                                                                  br(),
                                                                                  "5.- Now you can continue with the Fail back, ",strong("if the issue persists you have to perform this steps on the other
                                                                                   register,")," if the issue persist please contact a mentor"
                                                                                  )
                                                                         
                                                                         
                                                             ),
                                                            
                                                             ),
                                                    
                                                    tabPanel("Fail back",br(),
                                                             tabsetPanel(type = "tabs",
                                                                         
                                                                         tabPanel("What is it & When does it apply?",br(),
                                                                                  strong("What is it?"),br(),
                                                                                  "The Fail Back process is basically the counterpart of the Fail over",br(),
                                                                                  "It transfer all the information from the ER1 to the actual R1",br(),
                                                                                  br(),
                                                                                  strong("When does it apply?"),br(),
                                                                                  "It applies when there is already a Fail Over process previously applied so we can return the info to R1",
                                                                                  
                                                                                  ),
                                                                         
                                                                         tabPanel("Checks before starting",br(),
                                                                                  h2("Obligatory checks before performing the FB", style ="color:red"),br(),
                                                                                  strong("1.- DO NOT RUN DBBACKUP ON REGISTER 2, EVER.",br(),
                                                                                         br(),
                                                                                         "2.- Only ER1 should be on.",br(),
                                                                                         br(),
                                                                                         "3.- R2 should be on ER1, check this in c:\\bak - if there is a file called emergenc.flg that means that the register is in emergency mode.",br(),
                                                                                         br(),
                                                                                         "4.- Only ER1 should be on and R1 should not be connected to the power (the user can connect everything else).",br(),
                                                                                         br(),
                                                                                         "5.- The store has an stable internet connection - in case it does not please perform a L1 triage."
                                                                                         )
                                                                         
                                                                                  
                                                                                  ),
                                                                         
                                                                         tabPanel("E-mail backup",br(),
                                                                                  "The first step is to back up the e mails of the store.",br(),
                                                                                  "1.- Access to the file explorer of R1.",br(),
                                                                                  "To make this you have to open the citrix desktop and access to a file explorer",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF20.png", 
                                                                                                width = "800", align ="left")),br(),
                                                                                  br(),
                                                                                  "Once you entered the store the file explorer will ask for a password, you must use", strong("user:possvrsvc - PW:p0$$vr$vc"),br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF21.png", 
                                                                                                width = "500", align ="left")),br(),
                                                                                  br(),
                                                                                  "Select the C drive and go to c:\\pos\\mail - There right click the inbox folder, select cut and paste it on your citrix desktop,
                                                                                  We will save this e mails for the last part of our installation.",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF22.png", 
                                                                                                width = "400", align ="left")),br(),
                                                                                  ),
                                                                         
                                                                         tabPanel("FORT access",br(),
                                                                                  "To access to FORT we need Restricted Utilities (RU),",br(),
                                                                                  "To open RU you need the password generator. Open it on your desktop, under the tools shortcut on the 
                                                                                   right side of the screen. Once it opens, we will select the folder named Tools-Shortcut and then we will right click
                                                                                   the POS PasswordGenerator program, so we can ",strong("Run as administrator."),"If you do not
                                                                                   have the folder you can open the RUN application and type \\\\gvfile1\\IS\\HelpDesk\\Tools",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF17.png", #Foto de la desktop, 
                                                                                                width = "600", align ="left")),br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF18.png", #Foto de PW generator, 
                                                                                                width = "400", align ="left")),br(),
                                                                                  br(),
                                                                                  "On the register press ctrl + esc (it has to be inyected on TRC) and select Restricted utilities on the menu",br(),
                                                                                  "Where it says Enter Store # we will input the 4 digits of the store (or less if store has less number),
                                                                                   and on Enter Reg. # we will input the register we are working with.",strong("In case that the date does not match the current day,
                                                                                                                                         we will change it by pressing Change Date and
                                                                                                                                         select the date technician provide us"), strong(style = "color:red", 
                                                                                                                                                                                         "THIS ONLY WORKS IF IT WAS RUN AS ADMIN."),br(),
                                                                                  br(),
                                                                                  "Once we input the password now we have access to" ,strong("RU"),br(),
                                                                                  br(),
                                                                                  "Go to to tools(#5) - Fail over recovery tool",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF49.png", 
                                                                                                width = "400", align ="left")),br(),
                                                                                  br(),
                                                                                  "and FORT will open",br(),
                                                                         ),
                                                                         
                                                                         tabPanel("ER1 to R2",br(),
                                                                                  strong("Disclaimer: "),"Emergency Register 1 (ER1), this is R2 with the IP of R1, we have to change it back to the original IP.",br(),
                                                                                  br(),
                                                                                  strong("You have to do this step after a FO was performed previously (that is why R2 is in ER1)"),br(),
                                                                                  br(),
                                                                                  "Perform the following on Emergency Register 1 (Register 2):",br(),
                                                                                  br(),
                                                                                  "1.- Open Restricted utilities on ER1 and select the Fail Over Recovery Tool, the message",strong(" “Change Primary to Secondary” "),"will appear,
                                                                                  click YES and ER1 will shut down,",strong( "it will stay off"),", the computer will change the IP address to .12",br(),
                                                                                  br(),
                                                                                  "2.- Tell the user to finish the install of R1.",br(),
                                                                                  br(),
                                                                                  "3.- When the user finishes R1 installation tell him to connect the power cable and turn it on so you can start with the Fail back",br(),
                                                                         
                                                                         
                                                                         ),
                                                                         
                                                                         tabPanel("Fail back",br(),
                                                                                  "1.- Close all the programs that are open on the register, normally the program open is back office, to close this 
                                                                                  open restricted utilities and then open the task manager and end the POS, R1 should be on the black screen, property of GameStop.",br(),
                                                                                  br(),
                                                                                  "2.- Turn R2 on and let it boot all the way up [It will boot only to the black screen “Property of gamestop”] (this has to be R2 and not ER1 because the ER1 to R2 step has been performed).",br(), 
                                                                                  "If it does not please end al tasks on R2 until it is on a black screen property of gamestop",br(),
                                                                                  br(),
                                                                                  "3.- On", strong("R2"), "open Restricted utilities and select the Fail Over Recovery Tool option, you will get the message
                                                                                  “Ready for Fail back”, and the following window",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF33.png", 
                                                                                                width = "400", align ="left")),br(),
                                                                                  br(),
                                                                                  "Click OK on the message",br(),
                                                                                  strong("NOTE:Only an unknown register and R1 (ER1) should appear on that screen, if something else appears please contact LVL 2 or a LEAD"),br(),
                                                                                  br(),
                                                                                  "4.- Click on the Fail Back button, if you get the remote registry error go to the tab “remote registry” if you don't, go 
                                                                                  to step 5",br(),
                                                                                  br(),
                                                                                  "5.- You will get the message “File Not copied”, click YES on the message only if you don't get an", strong(".MDB"),"file, if you see an .MDB file",
                                                                                  strong("Contact LVL 2 or a Lead"),br(),
                                                                                  br(),
                                                                                  "6.- After that you will get a message “Fail Back Complete”, click OK, R1 will restart automatically, When R1 loads all the way to 
                                                                                  the POS R2 should restart, if it does not restart automatically just exit the Fail Over Recovery Tooland restart the computer manually",br(),
                                                                                  br(),
                                                                                  "7.- On R1 the register will be on back office, you have to close it with (ctrl + shift + z), R1 should be completely on a black screen"
                                                                                  ),
                                                                         
                                                                         tabPanel("E-mail return",br(),
                                                                                  "1.- On your citrix desktop open a file explorer and remote to R1 with \\\\usa0XXX-1, access to the C drive POS\\Mail
                                                                                  cut the Inbox folder that is on the desktop (the one we cut before the Fail Over), and paste it on c:\\POS\\mail, replace the 
                                                                                  inbox folder that is already there with yours",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF34.png", 
                                                                                                width = "600", align ="left")),br(),
                                                                                  
                                                                         ),
                                                                         
                                                                         tabPanel("AJBwaneps activation ",br(),
                                                                                  h3(strong("You must perform this steps on R1 & R2")),
                                                                                  "1.- Open the new restricted utilities (ERU), you can do this with a command prompt - input - elevaterestrictedutilities.exe",br(),
                                                                                  "The following will appear:",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF47.png", 
                                                                                                width = "600", align ="left")),br(),
                                                                                  br(),
                                                                                  "2.- Select device manager, and the following pop up will appear",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF46.png", 
                                                                                                width = "600", align ="left")),br(),
                                                                                  br(),
                                                                                  strong("TIP: the window may appear on the right, you can move it to the left so you can see the selection arrow"),br(),
                                                                                  br(),
                                                                                  "3.- Click the arrow key and select automatic, then select start services",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF48.png", 
                                                                                                width = "600", align ="left")),br(),
                                                                                  br(),
                                                                                  "4.- open again the admin command prompt - input", strong("cd.."),
                                                                                  "and then <enter>, Now you should be on the c:\\ directory on the command prompt. (If we are not input cd.. until we 
                                                                                                                                                 are on the c:\\ folder)",br(),
                                                                                  br(),
                                                                                  "5.-  input - ",strong("schtasks.exe /Run /TN AJBConfigManager"), "and press <Enter>, you should get a message of SUCCESS
                                                                                                                                                 if not check the syntaxis maybe something is misspelled",br(),
                                                                                  br(),
                                                                                  "6.- Input - ", strong("net stop AJBwaneps "), " - wait 10 seconds", strong("net start AJBwaneps"),"wait 10 seconds",br(),
                                                                                  br(),
                                                                                  "7.- You can now do the force poll"
                                                                                  ),
                                                                         
                                                                         
                                                                         
                                                                         tabPanel("Force poll",br(),
                                                                                  "1.- On your Citrix desktop, go to the tools shortcut, open Devtools - Help Desk Approved tools - Reset security (Global)",
                                                                                  "open the program and input the number of your store - Example: if your store is store USA05555, input 5555, on the following messages just press
                                                                                  ok on both messages",br(),
                                                                                  br(),
                                                                                  "2.- Remote to R1 file explorer and access to c:\\poll\\receive, leave this window open while you perform step 3.",br(),
                                                                                  br(),
                                                                                  "3.- Go to the tools shortcut, open Devtools - Go to POSDown Archives - archives - You should now see a list of folders named by date in YYYYMMDD format 
                                                                                  (Ex: 20201220 = 20th Dic. 2020.) Sort by Date Modified so the newest is at the top, and select the day BEFORE the current date you’re needing to drop the files on",br(),
                                                                                  "Ex - If we are installing on the 4th of january of 2021 you have to open the file 20210103",br(),
                                                                                  "Now you should see a list of numbers, this are store numbers so if you are installing store 5555 you must select the 5555 folder,
                                                                                  enter to the folder and copy it's files to the folder you opened on step 2 c:\\poll\\receive",br(),
                                                                                  br(),
                                                                                  "4.- We have to do the same process fo the actual day of the installation, so for the previous example we would have to open the 20210104
                                                                                  copy it's files to the c:\\poll\\receive your folder should be like the following:",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF35.png", #imagen de C2S files con el c:\poll\receive
                                                                                                width = "800", align ="left")),br(),
                                                                                  br(),
                                                                                  "5.- Now that we have the C2S files and we performed the security reset we can now make a “Force Poll” ",br(),
                                                                                  "Now open Restricted Utilities - go to the remotelink option (#1) - and select the force poll option, leave the computer make all it's processes and wait 
                                                                                  until the computer closes all the programs",br(),
                                                                                  br(),
                                                                                  "6.- On restricted utilities go to option (utilities #2), access to the printers folder and select the printer driver as default (It can be either 
                                                                                  HP1_Mono (if the printer is connected via Wi-Fi or ethernet), or it can be the name of the printer(if it is connected via USB)",br(),
                                                                                  br(),
                                                                                  "7.- Restart the R1 (when all the processes have finished) and now we can go to the Peripherals checkup step"
                                                                         ),
                                                                         
                                                                         tabPanel("Peripheral checkup",br(),
                                                                                  "This check up is performed with the employee of the store, tell the tech that you need the employee so he can put him on the line.",br(),
                                                                                  br(),
                                                                                  "1.- After the restart both registers should boot all the way to the POS (Back office), you should have the following open.",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF36.png", #imagen de back office sin re tech
                                                                                                width = "600", align ="left")),br(),
                                                                                  br(),
                                                                                  "2.- Tell the employee to open the register as normal, he will press F5 to open re tech and input the amount of money for the opening.",br(),
                                                                                  "If it does not open try TS the problem in hand as normal, if you cannot fix it contact lvl 2 or a LEAD .",br(),
                                                                                  br(),
                                                                                  "3.- Tell the employee to open the e-mails and his performance portal (If they open it is working), if the emails or the performance are not opening
                                                                                                       please try the following.",br(),
                                                                                  "Open c:\\POS\\Emails\\inbox - cut all the files in that folder and copy them into a new folder created on your citrix desktop",br(),
                                                                                  "When all the files are now on the new folder cut them again and copy them in the InBox folder of the register (this is an e mail refresh)",br(),
                                                                                  "If that does not work please contact a LEAD or LVL 2",br(),
                                                                                  br(),
                                                                                  "4.- Tell the employee to check the reserves on reservation manager, he will open back office and select the reservation manager option, the reserves
                                                                                                       should appear on the window pop up (If they do not appear please contact a LEAD or LVL 2)",br(),
                                                                                  br(),
                                                                                  "5.- Tell the employee to perform a transaction - here he will have to :",br(),
                                                                                  "A) Scan something (This tells us if the Scanner works).",br(),
                                                                                  "B) Check if the promotions are working (This will tell us if the C2S files were imported correctly).",br(),
                                                                                  "C) Make a card balance (Here we check the pinpad), if it does not work go to the Specific Hardware TS tab.",br(),
                                                                                  "D) Perform a customer lookup (This tells us if the information was traspassed correctly).",br(),
                                                                                  "E) Perform a trade (To see if re tech works correctly).",br(),
                                                                                  br(),
                                                                                  "6.- Tell the employee to print a label with the label printer (If that does not work TS accordingly with KB´s.)",br(),
                                                                                  br(),
                                                                                  "7.- Tell the employee to print a report with the HP printer (If that does not work TS accordingly with KB´s.).",br(),
                                                                                  br(),
                                                                                  "8.- Tell the employee to check the counts, he will open back office, open the inventory and the press shift + F12
                                                                                                       (if it does not open contact a LEAD or LVL 2).",br(),
                                                                                  br(),
                                                                                  "9.- Tell the employee to perform a no sale, (If that does not work TS accordingly with KB´s.).",br(),
                                                                                  br(),
                                                                                  "Perform the same checks in R2",br(),
                                                                                  "If everything works you can now tell the user to turn all his auxiliary registers on",
                                                                                  
                                                                         ),
                                                                         
                                                                         
                                                                         tabPanel("Remote Registry (only if necessary)",br(),
                                                                                  fluidPage(img(src = "RREG1.png", 
                                                                                                width = "500", align ="left")),br(),
                                                                                  br(),
                                                                                  "If you get the remote registry error on the Fail over or the Fail back part you have to follow this steps",br(),
                                                                                  br(),
                                                                                  strong("Note: On the fail back we have to do this on R1 & R2"),br(),
                                                                                  br(),
                                                                                  "1.- On restricted utilities select option tools (#5), and the open a DOS prompt",br(),
                                                                                  br(),
                                                                                  "2.- Input - ",strong("runas /u:possvrsvc cmd - PW:p0$$vr$vc"),"(the password will not type but it is being input)",br(),
                                                                                  br(),
                                                                                  "3.- On the new command input service.msc, select remote registry and click enter",br(),
                                                                                  br(),
                                                                                  "4.- On startup type select manual -> select apply -> select start",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "RREG2.png", 
                                                                                                width = "700", align ="left")),br(),
                                                                                  br(),
                                                                                  "5.- Now you can continue with the Fail back, ",strong("if the issue persists you have to perform this steps on the other
                                                                                   register,")," if the issue persist please contact a mentor"
                                                                         )
                                                                         
                                                                         )
                                                             
                                                             ),
                                                    
                                                    tabPanel("Switch and reverse",br(),
                                                             tabsetPanel(type = "tabs",
                                                                         tabPanel("What is it & When does it apply?",br(),
                                                                                  strong("What is it?"),br(),
                                                                                  "It is the combination of the Fail Over & Fail back processes.",br(),
                                                                                  "It allows us to skip some steps that we would have to do if we just ran both the FO & FB",br(),
                                                                                  br(),
                                                                                  strong("When does it apply?"),br(),
                                                                                  "The switch and reverse process applies when we have a working R1 and R2 but R1 is having some issues",br(),
                                                                                  "For example:",br(),
                                                                                  "R1 is a slow register.",br(),
                                                                                  "R1 is buggy and has a lot of issues.",br(),
                                                                                  "R1 is being replaced as part of a windows update",br(),
                                                                                  br(),
                                                                                  "When the user receives the new R1 you can perform this process, do not do a fail over unless the new R1 is in the store or R1 is completely unusable"
                                                                                  ),
                                                                         
                                                                         tabPanel("E-mail back up",br(),
                                                                                  
                                                                                  "1.- Access to the file explorer of R1.",br(),
                                                                                  "To make this you have to open the citrix desktop and access to a file explorer",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF20.png", 
                                                                                                width = "800", align ="left")),br(),
                                                                                  br(),
                                                                                  "Once you entered the store the file explorer will ask for a password, you must use", strong("user:possvrsvc - PW:p0$$vr$vc"),br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF21.png", 
                                                                                                width = "500", align ="left")),br(),
                                                                                  br(),
                                                                                  "Select the C drive and go to \\pos\\mail - There right click the inbox folder, select cut and paste it on your citrix desktop,
                                                                                  We will save this e mails for the last part of our installation",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF22.png", 
                                                                                                width = "400", align ="left")),br(),
                                                                                  br(),
                                                                                  
                                                                         ),
                                                                         tabPanel("Fail Over PT.1",br(),
                                                                                  
                                                                                  "Access to RU",br(),
                                                                                  fluidPage(img(src = "SF49.png", 
                                                                                                width = "400", align ="left")),br(),
                                                                                  br(),
                                                                                  "1.- on store tech support make sure that all the registers except R1 & R2 are off, this can be done with the pinger (STS tab),
                                                                                  If only R1 & R2 are pinging you can continue with step 2",br(),
                                                                                  br(),
                                                                                  "All auxilliary registers should be as follows:",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF23.png", 
                                                                                                width = "400", align ="left")),br(),
                                                                                  br(),
                                                                                  strong("Only R1 and R2 must ping."),br(),
                                                                                  br(),
                                                                                  "2.- Now that all the aux registers are off we will remote to R1 and R2, the best way to remote is to have both of them open at the same time
                                                                                  because we will need to do a lot of processes on both, exemplefied on the image below",br(),
                                                                                  "To remote to the registers we will use an application called TRC remote (located on the right side of your remote desktop [Yellow square on the image])",br(),
                                                                                  "To access to the registers we have to input the IP of the register that we need to access, and use -", strong("username: storeuser - PW: storeuser"),
                                                                                  "if that does not let you you can try -",strong(" username: possvrsvc - PW: p0$$vr$vc"),br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF25.png", 
                                                                                                width = "700", align ="left")),br(),
                                                                                  fluidPage(img(src = "SF26.png", 
                                                                                                width = "600", align ="left")),br(),
                                                                                  fluidPage(img(src = "SF24.png", 
                                                                                                width = "1000", align ="left")),br(),
                                                                                  br(),
                                                                                  "3.- Once you are on the registers open RU on both of them",br(),
                                                                                  "To open RU inyect ctrl + escape with the inyect function  (Green square) and open Restricted utilities (To know how to access 
                                                                                  you can go to the tab [Access to RU])",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF27.png", 
                                                                                                width = "600", align ="left")),br(),
                                                                                  br(),
                                                                                  "Now input the password from password generator so you can access to RU",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF28.png", 
                                                                                                width = "800", align ="left")),br(),
                                                                                  br(),
                                                                                  "Your desktop should look similar to this:",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF29.png", 
                                                                                                width = "800", align ="left")),br(),
                                                                                  br(),
                                                                                  
                                                                         ),
                                                                         
                                                                         tabPanel("Fail over PT.2",br(),
                                                                                  "4.- Close all the programs and processes that you can see on the computer, on this example we have to close GOV.EXE on R1 and
                                                                                  close Monitor.exe on R2",br(),
                                                                                  "To close them we have to open the task manager processes tab (On RU go to option utilities #2), and select task manager)",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF30.png", 
                                                                                                width = "400", align ="left")),br(),
                                                                                  br(),
                                                                                  "5.- Now that we are on a black screen on both registers we have to select on R1 RU (option tools #5) and select run DB backup,
                                                                                  then wait 10 seconds and go to R2, select Display BAK_1.zip file info, if the date is correct you can continue to step 6 ",
                                                                                  strong("if it is not contact any mentor so we can help you"),br(),
                                                                                  fluidPage(img(src = "SF31.png", 
                                                                                                width = "400", align ="left")),br(),
                                                                                  br(),
                                                                                  "6.- If the date is correct, turn off R1 & tell the user to Start with the installation of R1 
                                                                                  (Connect everything except the power cord)",br(),
                                                                                  br(),
                                                                                  
                                                                                  "7.- On R2 select the Fail Over recovery tool option (Located on tools #5), and select",strong("yes"),"on the pop up 
                                                                                  “Are you sure you want to launch the Fail Over Recovery Tool”",br(),
                                                                                  "Now the following window should appear",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF32.png", 
                                                                                                width = "500", align ="left")),br(),
                                                                                  br(),
                                                                                  "As you can see only the R2 square is blue, that means that only R2 is on, if there is another square open, please tell the tech to turn
                                                                                  off the register on question",br(),
                                                                                  br(),
                                                                                  "8.- Now click on the fail over button the message “Fail over to secondary” should appear, click", strong("yes"),"and the fail over will begin",br(),
                                                                                  strong("Note: You may have an error called Remote registry error, to fix that error you have to go to the tab called “Remote Registry” "),br(),
                                                                                  br(),
                                                                                  "9.- After you clicked yes on the fail over message the message “Verify backup file”, will appear", strong("Please check the date of the file"),"
                                                                                  if the file date is the same as the DBbackup we performed earlier click YES, if it is not correct",strong("Contact a mentor"),br(),
                                                                                  br(),
                                                                                  "10.- Then another message called “Verify missing Backup File” will appear",br(),
                                                                                  "As long as there is not any file with the extension", strong(".MDB"), "you can continue, if there is a file with an .MDB extension",strong("Please contact a mentor"),br(),
                                                                                  "After we clicked on YES, R2 will change it's name to R1 and the IP address will change to .11",br(),
                                                                                  br(),
                                                                                  "11.- R2 now is called Emergency R1 (ER1), we have to remote to ER1 with the IP address of R1",br(),
                                                                                  br(),
                                                                                  "12.- The message “Fail over complete” will appear, select OK on the message and ER1 will restart",br(),
                                                                                  br(),
                                                                                  "13.- After the restart remote to ER1, it shoould load all the way to the POS (back office and the menu), close back office (ctrl + shift + z - F5)
                                                                                  the computer should be on a black screeen, property of gamestop should be on the background",br(),
                                                                                  br(),
                                                                                  "14.- The Fail Over is completed.",br(),
                                                                                  br(),
                                                                                  "15.- Tell the user to install all R1 except the power cord"
                                                                                  
                                                                                  
                                                                                  
                                                                                  
                                                                         ),
                                                                         
                                                                         tabPanel("ER1 to R2",br(),
                                                                                  strong("Disclaimer: "),"Emergency Register 1 (ER1), this is R2 with the IP of R1, we have to change it back to the original IP.",br(),
                                                                                  br(),
                                                                                  strong("You have to do this step after the FO, R2 will remain off while the user is installing R1"),br(),
                                                                                  br(),
                                                                                  "On Emergency Register 1 (Register 2):",br(),
                                                                                  br(),
                                                                                  "1.- Open Restricted utilities on ER1 and select the Fail Over Recovery Tool, the message",strong(" “Change Primary to Secondary” "),"will appear,
                                                                                  click YES and ER1 will shut down,",strong( "it will stay off"),", the computer will change the IP address to .12",br(),
                                                                                  br(),
                                                                                  "2.- When the user finishes R1 tell him to turn it on and continue with the failback tab",br(),
                                                                                  
                                                                                  
                                                                                  
                                                                                  
                                                                         ),
                                                                         tabPanel("Fail back",br(),
                                                                                  "1.- Close all the programs that are open on the register, normally the program open is back office, to close this 
                                                                                  open restricted utilities and then open the task manager and end the POS, R1 should be on the black screen, property of GameStop.",br(),
                                                                                  br(),
                                                                                  "2.- Turn R2 on and let it boot all the way up [It will boot only to the black screen “Property of gamestop”] (this has to be R2 and not ER1 because the ER1 to R2 step has been performed).",br(), 
                                                                                  "If it does not please end al tasks on R2 until it is on a black screen property of gamestop",br(),
                                                                                  br(),
                                                                                  "3.- On", strong("R2"), "open Restricted utilities and select the Fail Over Recovery Tool option, you will get the message
                                                                                  “Ready for Fail back”, and the following window",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF33.png", 
                                                                                                width = "400", align ="left")),br(),
                                                                                  br(),
                                                                                  "Click OK on the message",br(),
                                                                                  strong("NOTE:Only an unknown register and R1 (ER1) should appear on that screen, if something else appears please contact LVL 2 or a LEAD"),br(),
                                                                                  br(),
                                                                                  "4.- Click on the Fail Back button, if you get the remote registry error go to the tab “remote registry” if you don't, go 
                                                                                  to step 5",br(),
                                                                                  br(),
                                                                                  "5.- You will get the message “File Not copied”, click YES on the message only if you don't get an", strong(".MDB"),"file, if you see an .MDB file",
                                                                                  strong("Contact LVL 2 or a Lead"),br(),
                                                                                  br(),
                                                                                  "6.- After that you will get a message “Fail Back Complete”, click OK, R1 will restart automatically, When R1 loads all the way to 
                                                                                  the POS R2 should restart, if it does not restart automatically just exit the Fail Over Recovery Tooland restart the computer manually",br(),
                                                                                  br(),
                                                                                  "7.- On R1 the register will be on back office, you have to close it with (ctrl + shift + z), R1 should be completely on a black screen"
                                                                         ),
                                                                         
                                                                         tabPanel("E-mail return",br(),
                                                                                  "1.- On your citrix desktop open a file explorer and remote to R1 with \\\\usa0XXX-1, access to the C drive POS\\Mail
                                                                                  cut the Inbox folder that is on the desktop (the one we cut before the Fail Over), and paste it on c:\\POS\\mail, replace the 
                                                                                  inbox folder that is already there with yours",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF34.png", 
                                                                                                width = "600", align ="left")),br(),
                                                                                  
                                                                         ),
                                                                         
                                                                         tabPanel("AJBwaneps activation ",br(),
                                                                                  h3(strong("You must perform this steps on R1 & R2")),
                                                                                  "1.- Open the new restricted utilities (ERU), you can do this with a command prompt - input - elevaterestrictedutilities.exe",br(),
                                                                                  "The following will appear:",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF47.png", 
                                                                                                width = "600", align ="left")),br(),
                                                                                  br(),
                                                                                  "2.- Select device manager, and the following pop up will appear",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF46.png", 
                                                                                                width = "600", align ="left")),br(),
                                                                                  br(),
                                                                                  strong("TIP: the window may appear on the right, you can move it to the left so you can see the selection arrow"),br(),
                                                                                  br(),
                                                                                  "3.- Click the arrow key and select automatic, then select start services",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF48.png", 
                                                                                                width = "600", align ="left")),br(),
                                                                                  br(),
                                                                                  "4.- open again the admin command prompt - input", strong("cd.."),
                                                                                  "and then <enter>, Now you should be on the c:\\ directory on the command prompt. (If we are not input cd.. until we 
                                                                                                                                                 are on the c:\\ folder)",br(),
                                                                                  br(),
                                                                                  "5.-  input - ",strong("schtasks.exe /Run /TN AJBConfigManager"), "and press <Enter>, you should get a message of SUCCESS
                                                                                                                                                 if not check the syntaxis maybe something is misspelled",br(),
                                                                                  br(),
                                                                                  "6.- Input - ", strong("net stop AJBwaneps "), " - wait 10 seconds", strong("net start AJBwaneps"),"wait 10 seconds",br(),
                                                                                  br(),
                                                                                  "7.- You can now do the force poll"
                                                                         ),
                                                                         
                                                                         
                                                                         
                                                                         tabPanel("Force poll",br(),
                                                                                  "1.- On your Citrix desktop, go to the tools shortcut, open Devtools - Help Desk Approved tools - Reset security (Global)",
                                                                                  "open the program and input the number of your store - Example: if your store is store USA05555, input 5555, on the following messages just press
                                                                                  ok on both messages",br(),
                                                                                  br(),
                                                                                  "2.- Remote to R1 file explorer and access to c:\\poll\\receive, leave this window open while you perform step 3.",br(),
                                                                                  br(),
                                                                                  "3.- Go to the tools shortcut, open Devtools - Go to POSDown Archives - archives - You should now see a list of folders named by date in YYYYMMDD format 
                                                                                  (Ex: 20201220 = 20th Dic. 2020.) Sort by Date Modified so the newest is at the top, and select the day BEFORE the current date you’re needing to drop the files on",br(),
                                                                                  "Ex - If we are installing on the 4th of january of 2021 you have to open the file 20210103",br(),
                                                                                  "Now you should see a list of numbers, this are store numbers so if you are installing store 5555 you must select the 5555 folder,
                                                                                  enter to the folder and copy it's files to the folder you opened on step 2 c:\\poll\\receive",br(),
                                                                                  br(),
                                                                                  "4.- We have to do the same process fo the actual day of the installation, so for the previous example we would have to open the 20210104
                                                                                  copy it's files to the c:\\poll\\receive your folder should be like the following:",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF35.png", #imagen de C2S files con el c:\poll\receive
                                                                                                width = "800", align ="left")),br(),
                                                                                  br(),
                                                                                  "5.- Now that we have the C2S files and we performed the security reset we can now make a “Force Poll” ",br(),
                                                                                  "Now open Restricted Utilities - go to the remotelink option (#1) - and select the force poll option, leave the computer make all it's processes and wait 
                                                                                  until the computer closes all the programs",br(),
                                                                                  br(),
                                                                                  "6.- On restricted utilities go to option (utilities #2), access to the printers folder and select the printer driver as default (It can be either 
                                                                                  HP1_Mono (if the printer is connected via Wi-Fi or ethernet), or it can be the name of the printer(if it is connected via USB)",br(),
                                                                                  br(),
                                                                                  "7.- Restart the R1 (when all the processes have finished) and now we can go to the Peripherals checkup step"
                                                                         ),
                                                                         
                                                                         tabPanel("Peripheral checkup",br(),
                                                                                  "This check up is performed with the employee of the store, tell the tech that you need the employee so he can put him on the line.",br(),
                                                                                  br(),
                                                                                  "1.- After the restart both registers should boot all the way to the POS (Back office), you should have the following open.",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SF36.png", #imagen de back office sin re tech
                                                                                                width = "600", align ="left")),br(),
                                                                                  br(),
                                                                                  "2.- Tell the employee to open the register as normal, he will press F5 to open re tech and input the amount of money for the opening.",br(),
                                                                                  "If it does not open try TS the problem in hand as normal, if you cannot fix it contact lvl 2 or a LEAD .",br(),
                                                                                  br(),
                                                                                  "3.- Tell the employee to open the e-mails and his performance portal (If they open it is working), if the emails or the performance are not opening
                                                                                                       please try the following.",br(),
                                                                                  "Open c:\\POS\\Emails\\inbox - cut all the files in that folder and copy them into a new folder created on your citrix desktop",br(),
                                                                                  "When all the files are now on the new folder cut them again and copy them in the InBox folder of the register (this is an e mail refresh)",br(),
                                                                                  "If that does not work please contact a LEAD or LVL 2",br(),
                                                                                  br(),
                                                                                  "4.- Tell the employee to check the reserves on reservation manager, he will open back office and select the reservation manager option, the reserves
                                                                                                       should appear on the window pop up (If they do not appear please contact a LEAD or LVL 2)",br(),
                                                                                  br(),
                                                                                  "5.- Tell the employee to perform a transaction - here he will have to :",br(),
                                                                                  "A) Scan something (This tells us if the Scanner works).",br(),
                                                                                  "B) Check if the promotions are working (This will tell us if the C2S files were imported correctly).",br(),
                                                                                  "C) Make a card balance (Here we check the pinpad), if it does not work go to the Specific Hardware TS tab.",br(),
                                                                                  "D) Perform a customer lookup (This tells us if the information was traspassed correctly).",br(),
                                                                                  "E) Perform a trade (To see if re tech works correctly).",br(),
                                                                                  br(),
                                                                                  "6.- Tell the employee to print a label with the label printer (If that does not work TS accordingly with KB´s.)",br(),
                                                                                  br(),
                                                                                  "7.- Tell the employee to print a report with the HP printer (If that does not work TS accordingly with KB´s.).",br(),
                                                                                  br(),
                                                                                  "8.- Tell the employee to check the counts, he will open back office, open the inventory and the press shift + F12
                                                                                                       (if it does not open contact a LEAD or LVL 2).",br(),
                                                                                  br(),
                                                                                  "9.- Tell the employee to perform a no sale, (If that does not work TS accordingly with KB´s.).",br(),
                                                                                  br(),
                                                                                  "Perform the same checks in R2",br(),
                                                                                  "If everything works you can now tell the user to turn all his auxiliary registers on",
                                                                                  
                                                                         ),
                                                                         
                                                                         
                                                                         
                                                                         tabPanel("Remote Registry (only if necessary)",br(),
                                                                                  fluidPage(img(src = "RREG1.png", 
                                                                                                width = "500", align ="left")),br(),
                                                                                  br(),
                                                                                  "If you get the remote registry error on the Fail over or the Fail back part you have to follow this steps",br(),
                                                                                  br(),
                                                                                  strong("Note: On the fail back we have to do this on R1 & R2"),br(),
                                                                                  br(),
                                                                                  "1.- On restricted utilities select option tools (#5), and the open a DOS prompt",br(),
                                                                                  br(),
                                                                                  "2.- Input - ",strong("runas /u:possvrsvc cmd - PW:p0$$vr$vc"),"(the password will not type but it is being input)",br(),
                                                                                  br(),
                                                                                  "3.- On the new command input service.msc, select remote registry and click enter",br(),
                                                                                  br(),
                                                                                  "4.- On startup type select manual -> select apply -> select start",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "RREG2.png", 
                                                                                                width = "700", align ="left")),br(),
                                                                                  br(),
                                                                                  "5.- Now you can continue with the Fail back, ",strong("if the issue persists you have to perform this steps on the other
                                                                                   register,")," if the issue persist please contact a mentor"
                                                                         )
                                                                         
                                                                         
                                                                         
                                                                         
                                                                         
                                                                         
                                                                         
                                                                         
                                                                         
                                                                         
                                                                        )
                                                             
                                                             )
                                                    
                                        )
                                ),
                                
                                
                                tabItem(tabName = "point_of_sale",
                                        img(
                                          src = "https://upload.wikimedia.org/wikipedia/commons/d/d0/RStudio_logo_flat.svg", 
                                          height = 45, width = 50, align ="right"),
                                        h1("Point of sale (POS)"),
                                        tabsetPanel(type = "tab",
                                                    
                                                    tabPanel("Back office",br(),
                                                             "Back office is the program where the users are able to perform all actions that have 
                                                             nothing to do with the sales itself",br(),
                                                             "The options that the users have are the following",br(),
                                                             br(),
                                                             fluidPage(img(src = "trc2.png", 
                                                                           width = 600, align ="left")),br(),
                                                             br(),
                                                             strong("F1"), " - label printing: The users are able to print labels with this option
                                                             they can print price changes, new SKU's and all types of labels. ",br(),
                                                             br(),
                                                             strong("F2"), " - Cover art: They can search to print a cover art for a game.",br(),
                                                             br(),
                                                             strong("F3"), " - Promotions: They can check promotions with this option.",br(),
                                                             br(),
                                                             strong("F4"), " - View journal: The users are able to check previous sales, and current sales, this can be printed
                                                             and they can find the reference ID to recover a lost DLC.",br(),
                                                             "For example you can use them for ",tags$a(href = KB67355, style = "color:green", " KB67355"),"to retrieve a lost DLC",br(),
                                                             br(),
                                                             strong("F5"), " - POS register: With this option the user is able to open re tech",br(),
                                                             br(),
                                                             strong("F6"), " - Live-Email: The user is able to open the e mail with this option",br(),
                                                             br(),
                                                             strong("F7"), " - Back office: This is the menu where they can access to human resources and more options, if the user is unable to access it 
                                                             you can use the SU to access it",br(),
                                                             br(),
                                                             strong("F8"), " - Upcoming releases: The users are able to see what are the releases that will come in the future",br(),
                                                             br(),
                                                             strong("F9"), " - Close for polling: The users have to close the registers everyday so the store can poll",br(),
                                                             br(),
                                                             strong("F10"), " - Item lookup: The user is able to look for item availability in the store or other stores inventory",br(),
                                                             br(),
                                                             strong("F11"), " - Reserve list: This option helps the users to check what guests that have reservations",br(),
                                                             br(),
                                                             strong("F12"), " - Kronos: This application is for clock in/out and to make schedule planners, and all work force related",br(),
                                                             br(),
                                                             strong("Shift + F1"), " - GSO: The users can access to GSO from here and from the menu itself",br(),
                                                             br(),
                                                             strong("Shift + F2"), " - WIS: Web in store they can access through the menu as well",br(),
                                                             br(),
                                                             strong("Shift + F12"), " - Performance dashboard: The users are able to check their performance from here",br(),
                                                             br(),
                                                             strong("Alt + F1"), " - Fixes the resolution of the register",br(),
                                                             br(),
                                                             strong("Ctrl + S"), " - You can check teh store information from here"
                                                             
                                                             
                                                             ),
                                                    
                                                    
                                                    tabPanel("Retech",br(),
                                                             "Retech is the program where the users perform their sales, this can also help us test peripherals and 
                                                             also perform trades"
                                                            
                                                             
                                                             
                                                             
                                                             ),
                                                    
                                                    
                                                    
                                                    
                                                    tabPanel("Inventory",br(),
                                                             tabsetPanel(type = "tabs",
                                                                         tabPanel("RSB's",
                                                                                  h3("What are RSB's"),
                                                                                  " Regional Stock Balance (RSB) occurs when the Store Support Center issues a transfer 
                                                                  request to ship product from one store to another.",br(),
                                                                                  " The RSB is used to balance the level of product from over stocked areas to under-stocked areas of the company.",br(),
                                                                                  br(),
                                                                                  em("Info provided by America Rodriguez")
                                                                         ),
                                                                         
                                                                         
                                                                         tabPanel("Distros",
                                                                                  h3("What are distros?"),
                                                                                  "Merchandise is distributed to stores based on their on-hand 
                                                                  quantities and the rate of sale for each product.",br(),
                                                                                  "When product levels in stores reach a threshold, the Distribution Center 
                                                                  is notified to replenish the stores stock of these items.",br(),
                                                                                  " All stores receive shipments of merchandise from the Distribution Center via UPS.",br(),
                                                                                  "Each store's inventory levels and replenishment rates are carefully planned and reviewed
                                                                  by the Store Support Center in coordination with the District Leader.",br(),
                                                                                  br(),
                                                                                  em("Info provided by America Rodriguez")
                                                                                  
                                                                         )))
                                        )
                                ),
                                
                                
                                tabItem(tabName = "store_network",
                                        img(
                                          src = "https://upload.wikimedia.org/wikipedia/commons/d/d0/RStudio_logo_flat.svg", 
                                          height = 45, width = 50, align ="right"),
                                        h1("Store network"),
                                        tabsetPanel(type = "tabs",
                                                    tabPanel("Store arrangement",br(),
                                                             "There are 3 placements for the network hardware in a store:",br(),
                                                             h3("Under the cashwrap"),br(),
                                                             br(),
                                                             fluidPage(img(src = "NETWORK1.png", 
                                                                           width = 600, align ="left")),br(),
                                                             br(),
                                                             fluidPage(img(src = "NETWORK5.png", 
                                                                           width = 600, align ="left")),br(),
                                                             br(),
                                                             h3("In the back room"),br(),
                                                             br(),
                                                             fluidPage(img(src = "NETWORK2.png", 
                                                                           width = 600, align ="left")),br(),
                                                             br(),
                                                             fluidPage(img(src = "NETWORK4.png", 
                                                                           width = 600, align ="left")),br(),
                                                             br(),
                                                             "It can also be in a tripplite box with lock, the SL should have it",br(),
                                                             br(),
                                                             fluidPage(img(src = "NETWORK7.png", 
                                                                           width = 600, align ="left")),br(),
                                                             br(),
                                                             fluidPage(img(src = "NETWORK9.png", 
                                                                           width = 600, align ="left")),br(),
                                                             br(),
                                                             
                                                             h3("On the ceiling"),br(),
                                                             br(),
                                                             fluidPage(img(src = "NETWORK3.png", 
                                                                           width = 600, align ="left")),br(),
                                                             br(),
                                                             
                                                             
                                                             
                                                             "Sometimes the user are not aware of the placement so you can guide them if you ask them to
                                                             look in any of this 3 places",br(),
                                                             br(),
                                                             "You have to have patience with the users because there are some stores with a rat's nest on their network equipment",br(),
                                                             "For example:",br(),
                                                             br(),
                                                             fluidPage(img(src = "NETWORK6.png", 
                                                                           width = 600, align ="left")),br(),
                                                             br(),
                                                             
                                                             
                                                             ),
                                                    tabPanel("Hardware IP's",br(),
                                                             "If you open Store Tech Support, you can see that the first 9 digits on an IP address are the same,
                                                             throughout all the store information, and the las 4 digits are different. This las 3 digits are the ones
                                                             that define the actual hardware of the store.",br(),
                                                             "This is a list of hardware with their respective IP:",br(),
                                                             br(),
                                                             "Register 1, 2, 3.... IP: Ends with 11, 12, 13.....",br(),
                                                             "For example R4's IP is XXX.XXX.XXX.14",br(),
                                                             br(),
                                                             "Network printer - Ends with .034 or .035 (Only for a second printer)",br(),
                                                             br(),
                                                             "Router - Ends with .200",br(),
                                                             br(),
                                                             "Switch - Ends with .242",br(),
                                                             br(),
                                                             "And so on, we can observe this under store tech support, the name of the hardware is next to the IP"
                                                             
                                                             ),
                                                    
                                                    tabPanel("Router",br(),
                                                             h3("FortiGate60D"),br(),
                                                             " The router is a small box with the fortinet brand on top",br(),
                                                             br(),
                                                             fluidPage(img(src = "ROUTER1.png", 
                                                                           width = 600, align ="left")),br(),
                                                             br(),
                                                             fluidPage(img(src = "sts2.png", 
                                                                           width = 600, align ="left")),br(),
                                                             br(),
                                                             fluidPage(img(src = "ROUTER2.png", #Router image
                                                                           width = 600, align ="left")),br(),
                                                             br(),
                                                             "The router is in charge of routing the Internet service provider connection through the store hardware, it is like a switch 
                                                             but with the router you can set and edit IP addresses",br(),
                                                             h3("Connections"),br(),
                                                             br(),
                                                             fluidPage(img(src = "ROUTER3.png", #Router image
                                                                           width = 600, align ="left")),br(),
                                                             br(),
                                                             
                                                             ),
                                                    
                                                    tabPanel("Switch",br(),
                                                             h3("Fortiswitch 124D"),br(),
                                                             
                                                             "The switch is in charge of routing the instructions that the router sends to the pertinent hardware",br(),
                                                             "It has 24 ports, it can be white or black and it is connected to the router from port 23 & 24 to 6 & 7 on the router",br(),
                                                             "The following are the connections for the switch",br(),
                                                             br(),
                                                             fluidPage(img(src = "SWITCH1.png", #Router image
                                                                           width = 600, align ="left")),br(),
                                                             br(),
                                                             br(),
                                                             fluidPage(img(src = "SWITCH2.png", #Router image
                                                                           width = 600, align ="left")),br(),
                                                             br(),
                                                             h3("Connections"),br(),
                                                             br(),
                                                             fluidPage(img(src = "SWITCH3.png", #Router image
                                                                           width = 600, align ="left")),br(),
                                                             br(),
                                                            
                                                             ),
                                                    tabPanel("ISP Modem",br(),
                                                             "There is 1 main ISP for the stores called comcast but there are more ISP´s for the stores.",br(),
                                                             "We have comcast and their modem is normally called Comcast business",br(),
                                                             "We have Tailwind",br(),
                                                             "We have Motorola",br(),
                                                             br(),
                                                             "This is the modem that provides internet connection to the entire store, it goes connected to the Router
                                                             port WAN 1",br(),
                                                             "The only TS we can do for the modem is to power cycle it",br(),
                                                             "It takes around 5 minutes after the restart for the internet to come back, if it does not you have to try other TS",br(),
                                                             br(),
                                                             fluidPage(img(src = "MODEM1.png", #Modem
                                                                           width = 600, align ="left")),br(),
                                                             br(),
                                                             br(),
                                                             fluidPage(img(src = "MODEM2.png", #Modem & router image
                                                                           width = 600, align ="left")),br(),
                                                             br(),
                                                             
                                                             ),
                                                    
                                                    tabPanel("WAP",br(),
                                                             "Cisco 3502i or FortiAP 221e, there is 1 Wireless access point on the stores and it can be either one of those",br(),
                                                             br(),
                                                             tabsetPanel(type = "tabs",
                                                                         tabPanel("Cisco 3502i",br(),
                                                                                  "The Cisco WAP is connected in the switch port #10, so naturally it is close to the switch.",br(),
                                                                                  br(),
                                                                                  "The best way to find the WAP is following the cable from the switch to it.",br(),
                                                                                  br(),
                                                                                  "It has Power over ethernet (POE), and the only cable connected to it is the ethernet cable.",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "WAP1.png", 
                                                                                                width = 600, align ="left")),br(),
                                                                                  br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "WAP2.png", 
                                                                                                width = 600, align ="left")),br(),
                                                                                  br(),
                                                                                  
                                                                                  ),
                                                                         
                                                                         tabPanel("FortiAP 221e",br(),
                                                                                  "This WAP is located on the ceiling, in the middle of the sales floor.",br(),
                                                                                  br(),
                                                                                  "There is not much we can TS with it because all the cabling is through the ceiling, 
                                                                                  and it is performed by a technitian, but we can check if it is connected on the switch.",br(),
                                                                                  br(),
                                                                                  "The WAP is connected on the switch port #10 and it has Power over ethernet (POE), so there is only 
                                                                                  one ethernet cable connected to it.",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "WAP3.png", 
                                                                                                width = 600, align ="left")),br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "WAP4.png", 
                                                                                                width = 600, align ="left")),br(),
                                                                                  br(),
                                                                                  )
                                                                         
                                                                         )
                                                             
                                                             
                                                             ),
                                                    
                                                    tabPanel("Patch Panel",br(),
                                                             "(Only stores with network equipment away from the registers)",br(),
                                                             br(),
                                                             fluidPage(img(src = "PPNET.png", 
                                                                           width = 600, align ="left")),br(),
                                                             br(),
                                                             "This is the HW that allows the store to have internet conection on all registers",br(),
                                                             br(),
                                                             fluidPage(img(src = "PPNET2.png", 
                                                                           width = 600, align ="left")),br(),
                                                             br(),
                                                             "The patch panel basically works as an extra long ethernet cable that goes arround the store, as you can see 
                                                             in the picture above all the blue cables go to the ceiling, and from the ceiling it goes to other parts of the store.",br(),
                                                             br(),
                                                             "This types of stores have a second patch panel under the cash wrap so they can match the cables connected on the back room.",br(),
                                                             "For example:",br(),
                                                             br(),
                                                             "If the store has port #1 on the router (the one for R1), connected on the port labeled “X”
                                                             R1 has to be connected on port “X” on the other patch panel.",br(),
                                                             br(),
                                                             "Basically you have to match the patch panel on the back with the one on the front."
                                                             
                                                             ),
                                                    
                                                    tabPanel("L1 triage (basic TS for all network)",br(),
                                                             tags$a(href = KB67070, style = "color:green", "KB67070"),"<- L1 triage KB",br(),
                                                             br(),
                                                             "This is the basic troubleshoot we perform when a store has any kind of network issues.",br(),
                                                             "To access to this list of stes to follow we have to select the option “Quick code value” ",br(),
                                                             br(),
                                                             fluidPage(img(src = "TRIAGE1.png", 
                                                                           width = 400, align ="left")),br(),
                                                             br(),
                                                             "Once you select the triage option the following will appear",br(),
                                                             br(),
                                                             fluidPage(img(src = "TRIAGE2.png", 
                                                                           width = 900, align ="left")),br(),
                                                             br(),
                                                             "If you follow everything and the issue persists you have to call the NOC team, give them the INC and 
                                                             warm transfer the call",br(),
                                                             strong("NOC number:  1-800-859-7821 ID 0152")
                                                             
                                                             ),
                                                    tabPanel("How to remote to the actual HW",br(),
                                                             "Sometimes it is useful to remote to the Router or switch, you can get more information
                                                             to fix an issue that the user is having",br(),
                                                             br(),
                                                             "To remote to the router or switch you have to open the citrix desktop and access to google chrome",br(),
                                                             br(),
                                                             fluidPage(img(src = "REMOTE1.png", 
                                                                           width = 900, align ="left")),br(),
                                                             br(),
                                                             fluidPage(img(src = "REMOTE2.png", 
                                                                           width = 900, align ="left")),br(),
                                                             br(),
                                                             h3("Pertinent info you can gather"),
                                                             h4(strong("Switch")),br(),
                                                             br(),
                                                             fluidPage(img(src = "REMOTE3.png", 
                                                                           width = 900, align ="left")),br(),
                                                             br(),
                                                             h4(strong("Router")),br(),
                                                             br(),
                                                             fluidPage(img(src = "REMOTE4.png", 
                                                                           width = 900, align ="left")),br(),
                                                             br(),
                                                             )
                                                    
                                                    
                                                    
                                                    )
                                        
                                        
                                        
                                        
                                ),
                                
                                
                                tabItem(tabName = "our_apps",
                                        img(
                                          src = "https://upload.wikimedia.org/wikipedia/commons/d/d0/RStudio_logo_flat.svg", 
                                          height = 45, width = 50, align ="right"),
                                        h1("Our apps"),
                                        tabsetPanel(type = "tab",
                                                    tabPanel("Orders",br(),
                                                             "To make or search a hardware order you must enter to the following link ->",
                                                             tags$a(href = Orders,style = "color:green", "CC Orders"),br(),
                                                             br(),
                                                             tabsetPanel(type = "tab",
                                                                         tabPanel("How to make an order",br(),
                                                                                  "The orders portal will open and you will have to access with your CompuCom credentials",br(),
                                                                                  "On the products tab you can order the hardware that you need (The images example is an M452DW",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "order1.png", 
                                                                                                width = 600, align ="left")),br(),
                                                                                  br(),
                                                                                  "Select the hardware that you need and the hardware order list should appear",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "order2.png", 
                                                                                                width = 600, align ="left")),br(),
                                                                                  br(),
                                                                                  "Select checkout when you are certain that you have all the orders",strong("double check your cart before ordering"),br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "order3.png", 
                                                                                                width = 600, align ="left")),br(),
                                                                                  br(),
                                                                                  "Once you are on the checkout page you have to fill the following spaces:",br(),
                                                                                  br(),
                                                                                  strong("General information"),br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "order4.png", 
                                                                                                width = 600, align ="left")),br(),
                                                                                  br(),
                                                                                  "You have to fill the Name of the person that is asking for the product and the phone number of either the store or the user",br(),
                                                                                  br(),
                                                                                  strong("Billing address"),br(),
                                                                                  br(),
                                                                                  
                                                                                  fluidPage(img(src = "order9.png", 
                                                                                                width = 600, align ="left")),br(),
                                                                                  br(),
                                                                                  strong("Shipping address"),br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "order5.png", 
                                                                                                width = 600, align ="left")),br(),
                                                                                  br(),
                                                                                  "Here you have to input the store number and then you have to input filter, the following will appear",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "order6.png", 
                                                                                                width = 600, align ="left")),br(),
                                                                                  br(),
                                                                                  "When you have the address make sure to ask the user if the address is correct, in case that it is not see the tab (Address incorrect)",br(),
                                                                                  br(),
                                                                                  strong("Payment details"),br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "order8.png", 
                                                                                                width = 600, align ="left")),br(),
                                                                                  br(),
                                                                                  strong("Note: If you are making a second order with the same INC you have to add the -1 to the Purcahse order number,
                                                                         if you miss this the order will not get processed"),br(),
                                                                                  br(),
                                                                                  "After that you have to continue to the next page where there is a summary of your order",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "order11.png", 
                                                                                                width = 600, align ="left")),br(),
                                                                                  br(),
                                                                                  "After that confirm the order and copy the C number on SNOW Flex Field 1 & the SKU of the most important item on Flex field 2",br(),
                                                                                  br(),
                                                                                  strong("Service now configuration"),br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "order12.png", 
                                                                                                width = 600, align ="left")),br(),
                                                                                  br(),
                                                                                  "After you finished the order you have to change the assigment group to stsc - pending HW orders",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "order13.png", 
                                                                                                width = 600, align ="left")),br(),
                                                                                  br(),
                                                                                  "And you have to leave the incident state to awaiting vendor"
                                                                                  
                                                                                  
                                                                                  
                                                                                  
                                                                         ),
                                                                         tabPanel("How to search an order",br(),
                                                                                  "To search an order you need the C number of the order, the C number is the CompuCom sales reference number",br(),
                                                                                  "When you have the C number, go to the orders portal an select the resources tab",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "order15.png", 
                                                                                                width = 600, align ="left")),br(),
                                                                                  br(),
                                                                                  "Go to advance search and on the sales reference number square input and paste the C number",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "order16.png", 
                                                                                                width = 600, align ="left")),br(),
                                                                                  br(),
                                                                                  "Or you can input the INC number as the Purchase order number (P.O#)",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "order19.png", 
                                                                                                width = 600, align ="left")),br(),
                                                                                  br(),
                                                                                  "The order will appear and you have to select the truck on the far right to follow the shipment (if there is no truck the order has not been shipped yet)",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "order17.png", 
                                                                                                width = 900, align ="left")),br(),
                                                                                  br(),
                                                                                  "When you click on the truck the following tracking number will appear, this is the fedex tracking number, you can click it 
                                                                  and it will take you to the Fedex web page with the information of the order and the date of arrival",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "order18.png", 
                                                                                                width = 600, align ="left")),br(),
                                                                                  
                                                                         )
                                                             )),
                                                    tabPanel("Airwatch",br(),
                                                             tags$a(href = Airwatch,style = "color:green", "Airwatch"),
                                                             "<- Click the hiperlink to go to the portal",br(),
                                                             br(),
                                                             tabsetPanel(type = "tabs",
                                                                         tabPanel("What is Airwatch?",br(),
                                                                                  "Airwatch is the tool that we use to have access to the Ipads of the stores.",br(),
                                                                                  "With this tool we can:",br(),
                                                                                  br(),
                                                                                  "1.- Delete app and install them",br(),
                                                                                  "2.- Delete certificates ",br(),
                                                                                  "3.- Set a tablet on lost mode if it gets stolen",br(),
                                                                                  "4.- Update the tablet to the newest Ios version",br(),
                                                                                  "5.- Reset the passcode in case that the user forgets it (Employee verification needed)",br(),
                                                                                  br(),
                                                                                  "Airwatch is a CompuCom provided tool so we need to use the CompuCom credentials to log in"
                                                                         ),
                                                                         
                                                                         
                                                                         
                                                                         tabPanel("How to use it",
                                                                                  br(),
                                                                                  "First you have to access with your CC credentials",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "airwatch.png", 
                                                                                                width = 400, align ="left")),br(),
                                                                                  br(),
                                                                                  "When you are on the main dashboard go to the magnifying glass on the top right
                                                                  and input the store number",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "airwatch1.png", 
                                                                                                width = 600, align ="left")),br(),
                                                                                  br(),
                                                                                  "After that select the tablet of your store, If there are more than 2 tablets, select the one 
                                                                  with the most recent *last seen* status",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "airwatch3.png", 
                                                                                                width = 600, align ="left")),br(),
                                                                                  br(),
                                                                                  "Now it depends what you want to do, either download an app or a certificate or the issue on hand"
                                                                                  
                                                                         ),
                                                                         tabPanel("KB's for it",br(),
                                                                                  tags$a(href = KB81321, "KB81321" ),"<- Missing Application(s) from the SSA tablets",br(),
                                                                                  br(),
                                                                                  tags$a(href = KB66648 , "KB66648"), "<- Tablet unable to connect GSSM Wi-Fi Network (Domestic)",br(),
                                                                                  br(),
                                                                                  tags$a(href = KB68274  , "KB68274"), "<- SSA Tablet Shows iPad Disabled or Connect to Itunes",br(),
                                                                                  br(),
                                                                                  tags$a(href = KB105347  , "KB105347"), " <- How To - Find the Serial Number of the Store's iPad",br(),
                                                                                  br(),
                                                                                  tags$a(href = KB73780  , "KB73780"), "<- Tablet Report is Showing Zero Usage",br(),
                                                                                  br(),
                                                                                  tags$a(href = KB111555  , "KB111555"), "<- Stores Requesting Access to Social Media Applications",br(),
                                                                                  br(),
                                                                                  tags$a(href = KB67998  , "KB67998"), "<- Default Passcode and Reset a Passcode",br(),
                                                                                  br(),
                                                                                  "This are the most common KB's for airwatch if you need anything else you can look it up on SNOW"
                                                                                  
                                                                                  
                                                                         )
                                                                         
                                                             )
                                                             
                                                             
                                                             
                                                    ),
                                                    
                                                    tabPanel("Citrix",br(),
                                                             tags$a(href = Citrix, style = "color:green", "Citrix"),"<- Access to the citrix log in page",br(),
                                                             br(),
                                                             tabsetPanel(type = "tab",
                                                                         tabPanel("What is citrix?",br(),
                                                                                  "Citrix is a Gamestop provided tool that is on the intranet of GS, this allows us to access to
                                                                  different files and programs that are property of GameStop.",br(),
                                                                                  "For example we can remote to the registers or access to the files of the registers, know if a computer polled
                                                                  or even reset the password of an employee, and more utilities!!!",br(),
                                                                                  br(),
                                                                                  "This is how the main menu looks like",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "citrix1.png", 
                                                                                                width = 800, align ="left")),br(),
                                                                                  
                                                                                  
                                                                                  
                                                                                  
                                                                         ),
                                                                         tabPanel("Most useful apps",br(),
                                                                                  tabsetPanel(type = "tabs",
                                                                                              tabPanel("Active Directory & Employee verification",br(),
                                                                                                       fluidPage(img(src = "citrix2.png", 
                                                                                                                     width = 600, align ="left")),br(),
                                                                                                       br(),
                                                                                                       "I put this two aplications toguether because it is mandatory to make an employee verification in order to make a password reset",br(),
                                                                                                       br(),
                                                                                                       tags$a(href = KB67360, style = "color:green", "KB67360"), "<- Use this KB so you can
                                                                                       do a password reset for a user here you need to use the AD and employee verification tools"
                                                                                                       
                                                                                                       
                                                                                                       
                                                                                              ),
                                                                                              
                                                                                              
                                                                                              
                                                                                              tabPanel("TRC remote",br(),
                                                                                                       fluidPage(img(src = "citrix3.png", 
                                                                                                                     width = 500, align ="left")),br(),
                                                                                                       br(),
                                                                                                       "The TRC remote tool helps us to access the registers operating system, so we can move the cursor on the
                                                                                       store computer and TS our way to solve the stores current issue",br(),
                                                                                                       br(),
                                                                                                       fluidPage(img(src = "trc2.png", 
                                                                                                                     width = 500, align ="left")),br(),
                                                                                                       br(),
                                                                                                       "It has some useful tools to interact with the POS",br(),
                                                                                                       br(),
                                                                                                       strong("The inyect command"),br(),
                                                                                                       br(),
                                                                                                       fluidPage(img(src = "trc3.png", 
                                                                                                                     width = 300, align ="left")),br(),
                                                                                                       "With this you can inyect the commands on the register, for example we can open the task manager (Only for win 7), or we can inyect
                                                                                       cntrl + escape",br(),
                                                                                                       br(),
                                                                                                       strong("The Toolbox"),br(),
                                                                                                       fluidPage(img(src = "trc4.png", 
                                                                                                                     width = 400, align ="left")),br(),
                                                                                                       br(),
                                                                                                       "With the toolbox you can paste your text on the actual register, this works by inputting a letter, this open a pop up and there you can 
                                                                                       paste the text",br(),
                                                                                                       br(),
                                                                                                       strong("Scaled view"),br(),
                                                                                                       br(),
                                                                                                       fluidPage(img(src = "trc5.png", 
                                                                                                                     width = 300, align ="left")),br(),
                                                                                                       br(),
                                                                                                       "Here you can scale the registers actual view to the size of your window on TRC for example:",br(),
                                                                                                       br(),
                                                                                                       fluidPage(img(src = "trc6.png", 
                                                                                                                     width = 600, align ="left")),br(),
                                                                                              ),
                                                                                              
                                                                                              
                                                                                              tabPanel("Store tec support",br(),
                                                                                                       fluidPage(img(src = "citrix4.png", 
                                                                                                                     width = 600, align ="left")),br(),
                                                                                                       br(),
                                                                                                       "Store tec support is the most useful application, here you can know if a store has network connection or if a register is working
                                                                                       , or if the printer is connected to the network, you can know the model of the registers or the type of phones that a store has, and much much more!!",br(),
                                                                                                       br(),
                                                                                                       "The GUI of the application is shown on the following images:",br(),
                                                                                                       br(),
                                                                                                       strong("The pinger"),br(),
                                                                                                       "Here you can know if a store is pinging, a ping is a signal that you send to a hardware, if it is connected to the network
                                                                                       it will be as the image on the left (greeen), and if it is not connected it will be as the one on the right (red)",br(),
                                                                                                       br(),
                                                                                                       fluidPage(img(src = "sts4.png", 
                                                                                                                     width = 600, align ="left")),br(),
                                                                                                       
                                                                                                       br(),
                                                                                                       strong("Store techincal support"),br(),
                                                                                                       br(),
                                                                                                       fluidPage(img(src = "sts.png", 
                                                                                                                     width = 600, align ="left")),br(),
                                                                                                       br(),
                                                                                                       fluidPage(img(src = "sts1.png", 
                                                                                                                     width = 600, align ="left")),br(),
                                                                                                       br(),
                                                                                                       fluidPage(img(src = "sts2.png", 
                                                                                                                     width = 600, align ="left")),br(),
                                                                                                       br(),
                                                                                                       "To access to the next image, you have to input - http://storesupport/GrpStores/PingerVLAN03.Asp - on your intenet explorer
                                                                                       (where STS opens), here you can ping the printers and the network connections",br(),
                                                                                                       br(),
                                                                                                       fluidPage(img(src = "sts3.png", 
                                                                                                                     width = 600, align ="left")),br(),
                                                                                                       
                                                                                                       
                                                                                              ),
                                                                                              
                                                                                              
                                                                                              tabPanel("Bigfix reporting",br(),
                                                                                                       fluidPage(img(src = "citrix5.png", 
                                                                                                                     width = 600, align ="left")),br(),
                                                                                                       "The most useful aplication for this app is for you to know when was a register imaged (When the software was implemented to the hardware
                                                                                       For this you have to follow the following:",br(),
                                                                                                       br(),
                                                                                                       "1.- Access to bigfix reporting"
                                                                                                       
                                                                                                       
                                                                                              ),
                                                                                              
                                                                                              
                                                                                              tabPanel("ECOM portal",br(),
                                                                                                       fluidPage(img(src = "citrix6.png", 
                                                                                                                     width = 600, align ="left")),br(),
                                                                                                       "We use this application for",tags$a(href = KB67355, style = "color:green", " KB67355"),br(),
                                                                                                       "Here it is explained how to get a DLC code for a game that was not printed correctly, remember that 
                                                                                                       you have to make an employee verification before giving the code",br(),
                                                                                                       br(),
                                                                                                       
                                                                                                       
                                                                                              )
                                                                                              
                                                                                              
                                                                                  )
                                                                                  
                                                                                  
                                                                         ),
                                                                         tabPanel("Citrix Desktop",br(),
                                                                                  tabsetPanel(type = "tabs",
                                                                                              tabPanel("What is it?",br(),
                                                                         "It is basically a remote desktop inside the GameStop enviroment, so we are able to interact with othe GS HW",br(),
                                                                         "To access to the citrix desktop you have to click on the top button that says desktop and select “Compucom Store Support Desktop”",br(),
                                                                         br(),
                                                                         fluidPage(img(src = "citrix7.png", 
                                                                                       width = 600, align ="left")),br(),
                                                                         br(),
                                                                         "Access with your Gamestop credentials v_....",br(),
                                                                         "The remote desktop takes around 2 minutes to setup, after the setup you should see the following",br(),
                                                                         br(),
                                                                         fluidPage(img(src = "CITDESK1.png", 
                                                                                       width = 800, align ="left")),br(),
                                                                         br(),
                                                                         "We can remote to registers with TRC remote, remote to hardware with Google chrome and a lot more with our citrix tools"
                                                                         ),
                                                                                              tabPanel("Citrix desktop tools details",br(),
                                                                                                       "On the tools - Shortcut you will have access to the following",br(),
                                                                                                       br(),
                                                                                                       fluidPage(img(src = "CITDESK2.png", 
                                                                                                                     width = 800, align ="left")),br(),
                                                                                                       br(),
                                                                                                       h3("POSPasswordGenerator"),br(),
                                                                                                       "All GS registers have something called restricted utilities, this program asks for a password
                                                                                                       you can get the passcode from this citrix app",br(),
                                                                                                       "You have to right click on the file and open it as an administrator and you will see the following",br(),
                                                                                                       br(),
                                                                                                       fluidPage(img(src = "CITDESK3.png", 
                                                                                                                     width = 600, align ="left")),br(),
                                                                                                       br(),
                                                                                                       h3("Google chrome"),br(),
                                                                                                       "With google chrome you can access to the actual hardware GUI of the store, this can be the router,
                                                                                                       the switch, the printer & the VOIP",br(),
                                                                                                       "You have to access via the browser on top and input https://10.xxx.xxx.xxx <enter>",br(),
                                                                                                       "You should see the following (If you do not check if the HW is pinging on store tech support)",br(),
                                                                                                       br(),
                                                                                                       fluidPage(img(src = "CITDESK5.png", 
                                                                                                                     width = 600, align ="left")),br(),
                                                                                                       br(),
                                                                                                       "After you proceed with the IP you have to input your GS credentials",br(),
                                                                                                       "You can have the following screens",br(),
                                                                                                       br(),
                                                                                                       fluidPage(img(src = "CITDESK6.png", 
                                                                                                                     width = 600, align ="left")),br(),
                                                                                                       br(),
                                                                                                       h3("TRC remote"),br(),
                                                                                                       fluidPage(img(src = "citrix3.png", 
                                                                                                                     width = 500, align ="left")),br(),
                                                                                                       br(),
                                                                                                       "The TRC remote tool helps us to access the registers operating system, so we can move the cursor on the
                                                                                       store computer and TS our way to solve the stores current issue",br(),
                                                                                                       br(),
                                                                                                       "Details are on the “Most useful apps” tab"
                                                                                  
                                                                                                       ),
                                                                         tabPanel("Remote to the register files",br(),
                                                                                  "You can remote to the register files with the citrix desktop",br(),
                                                                                  h3("Step 1"),br(),
                                                                                  "Open a file explorer",br(),
                                                                                  h3("Step 2"),br(),
                                                                                  "Click on the finder and input the store number as USA0XXXX-#, # being the register number",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "CITDESK7.png", 
                                                                                                width = 600, align ="left")),br(),
                                                                                  br(),
                                                                                  h3("Step 3"),br(),
                                                                                  "Access with the following credentials - possvrsvc - PW: p0$$vr$vc",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "CITDESK8.png", 
                                                                                                width = 600, align ="left")),br(),
                                                                                  br(),
                                                                                  h3("Step 4"),br(),
                                                                                  "You are now in the C drive and able to access to the register files!",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "CITDESK9.png", 
                                                                                                width = 600, align ="left")),br(),
                                                                                  br(),
                                                                                  )
                                                                                            )
                                                                                )
                                                                         )
                                                             
                                                             
                                                    ),
                                                    
                                                    
                                                    tabPanel("Service now",br(),
                                                             "Here You can learn how to configure your SNOW tickets, create useful filters, and update HW orders",br(),
                                                             tags$a(href = SNOW, style = "color:green", "SNOW"),"<- Access to the SNOW log in page",br(),
                                                             br(),
                                                             tabsetPanel(type = "tabs",
                                                                         tabPanel("Configuration",br(),
                                                                                  h3("Step 1"),br(),
                                                                                  "This image is the first step you have to perform before saving the ticket for 
                                                                                  the first time",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SNOW1.png", 
                                                                                                width = 1100, align ="left")),br(),
                                                                                  "After that, more options are going to be available that you have to fill out, the Configuration item, CI 
                                                                                  KB attachment, ETC",br(),
                                                                                  br(),
                                                                                  h3("Step 2"),br(),
                                                                                  fluidPage(img(src = "SNOW3.png", 
                                                                                                width = 900, align ="left")),br(),
                                                                                  h3("Step 3"),br(),
                                                                                  fluidPage(img(src = "SNOW2.png", 
                                                                                                width = 900, align ="left")),br(),
                                                                                  h3("Step 4 (KB attachment saves your progress)"),br(),
                                                                                  fluidPage(img(src = "SNOW4.png", 
                                                                                                width = 900, align ="left")),br(),
                                                                                  br(),
                                                                                  h3("Write your work notes on NOTES and if you have a chat copy all the chat on WORK")),
                                                                         
                                                                         
                                                                         tabPanel("Resolution of an INC",br(),
                                                                                  "To resolve your INC you just have to modify the following aspects of the ticket",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SNOW5.png", 
                                                                                                width = 900, align ="left")),br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SNOW6.png", 
                                                                                                width = 900, align ="left")),br(),
                                                                                  br(),
                                                                                  h3("Note: For the resolve first contact you have to resolve the ticket in the first 4 hours")),
                                                                         
                                                                         
                                                                         tabPanel("Escalation groups",br(),
                                                                                  "We have the following groups, we do not escalate, only the leads are able to escalate incidents",br(),
                                                                                  strong(h3("STSC GV")),br(),
                                                                                  "This is our level 2 group, they are directly associated with GameStop, when we follow the KB all the
                                                                                  way and the issue persists, we ask on our chat group for our issue to be escalated",br(),
                                                                                  strong(h3("STSC Additional HW request")),br(),
                                                                                  "There are stores that have a limit of registers that can be ordered for them, this limit is located 
                                                                                  on the i icon next to the location space",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SNOW7.png", 
                                                                                                width = 900, align ="left")),br(),
                                                                                  br(),
                                                                                  strong(h3("STSC Pending HW orders")),br(),
                                                                                  "Here we add the items that we have ordered and we are waiting for them to arrive",br(),
                                                                                  "We have to update the tickets that are on this group daily with the update of fedex so we know when the HW is arriving",br(),
                                                                                  "For example",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SNOW8.png", 
                                                                                                width = 900, align ="left")),br(),
                                                                                  br(),
                                                                                  strong(h3("STSC Telecom")),br(),
                                                                                  "We assign the tickets with telecomunication issues here to have the updated amount of stores with telephone issues on our eye",br(),
                                                                                  "This is just for the phones and it is not an actal escalation group, so we have to assing it to us and continue with the TS",
                                                                                  ),
                                                                         tabPanel("Configuration item and Support function",br(),
                                                                                  "For the configuration item we have to input the store number, and we have to input the corresponding 
                                                                                  item we are supporting on the support function",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SNOW9.png", 
                                                                                                width = 900, align ="left")),br(),
                                                                                  br(),
                                                                                  "For the Ice machines it changes, it is as it follows",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SNOW10.png", 
                                                                                                width = 900, align ="left")),br(),
                                                                                  br(),
                                                                                  "We also have the following for password resets",br(),
                                                                                  br(),
                                                                                  fluidPage(img(src = "SNOW11.png", 
                                                                                                width = 900, align ="left")),br(),
                                                                                  br(),
                                                                                  )
                                                                         
                                                                         )
                                                             )
                                        )
                                )
                                
                                
                            ) 
                        )
                    )
                    
                    
)







#Server
server <- function(input, output, session){
  
  user_vec <- c("3052" = "3052",
                "213905" = "GSSD",
                "213906" = "GSSM-1012",
                "user456" = "password2",
                "prrskiofble" = "GS123+")
  
  observeEvent(input$login, {
    
    if (str_to_lower(input$username) %in% names(user_vec)) { # is username in user_vec?
      
      if (input$password == unname(user_vec[str_to_lower(input$username)])) {
        
        # > Add MainPanel and Sidebar----------
        shinyjs::show(id = "Sidebar")
        
        appendTab(inputId = "tabselected", GSGUI)
        
        
        removeTab(inputId = "tabselected",
                  target = "1")
        
      } else { # username correct, password wrong
        
        # specify if needed
        
      } # closes if-clause
      
    } else { # username name wrong 
      
      # specify if needed
      
    } # closes second if-clause
    
  }) # closes observeEvent
  
  
  # observeEvent(input$refresh, {
  #   shinyjs::js$refresh()
  # })
  
  
  
} # Closes server


#Needs a server and a ui to work it can contain all code or can be set at the end 
#for it to work as well

shinyApp(ui = ui, server = server)
