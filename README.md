T2A2 - Marketplace Project
Thu May 27, 2021 23:55

<!-- # Brief -->
<!-- You are to design, build, deploy and present a Ruby on Rails web application (app). -->
<!--  -->
<!-- You must build a two sided marketplace. This app will cater to two markets that your app brings together. For example: -->
<!--  -->
<!-- - Ebay with buyers & sellers -->
<!-- - AirBnB with travellers & house owners -->
<!-- - Uber with travellers & drivers -->
<!--  -->
<!-- Some suggested starting ideas: -->
<!--  -->
<!-- - A tutor marketplace helping uni students find other uni students to help them with their study. -->
<!-- - A recruitment tool to rofile candidates to employers. -->
<!-- - Or you can build any two-sided marketplace you like. (Keep it simple!) -->
<!--  -->
<!-- You must complete all of the requirements specified below. -->

<!-- # Requirements -->
<!-- Requirements for this project are divided into three major parts, -->
<!--  -->
<!-- 1. Code/Technology -->
<!-- 1. Documentation -->
<!-- 1. Presentation -->
<!--  -->

# Background
In order to find assistance to complete odd jobs in the home, online searching will usually provide major companies that will charge marked up prices. Local handymen need to rely on word of mouth in order to advertise their services to compete with the major companies. 
## Scope
<!-- CMP1042-3.1 understanding of the problems that exist in a relevant marketplace that needs disrupting -->
Major companies have a monopoly on advertisement and can afford to pay to be listed first in search engines, they push this cost to the homeowners. Smaller handymen can do a job without the significant overheads of a major company and can offer to do the same jobs for cheaper; In addition, they are held accountable, thus have to rely on good reviews and generally do a better job.

[Link to Heroku](https://andrewduggan-t2a2.herokuapp.com/)

[Link to GitHub](https://github.com/NekoUnborn/AndrewDuggan_T2A2)

[Link to Trello Board](https://trello.com/b/00cOEdAV/andrewduggant2a2)

## R11 - Description of your marketplace app (website), including:
### Purpose
This App will join the two, giving the local homeowners access to the handymen in their location and handymen access to jobs.
### Functionality / features
The users will be able to login
Posting jobs
Posting services
Messaging system
Email updates
Two factor login
Reviews

### Sitemap
### Screenshots
### Target audience
Homeowners
Small Business Handymen
- Tech stack (e.g. html, css, deployment platform, etc)
Rails
HTML
CSS
Heroku

## R12 - User stories for your app
<!-- CMP1042-6.1 user stories -->
The MVP user stories are:
As a User, I want to be able to log in, to access my own jobs and messages.
As a User, I want to be able operate as a customer and/or provider, in order to use the app from both sides.
As an Admin, I want to be able to have the ability to ban/delete users.
As a Customer, I want to be able to post jobs, in order to request assistance.
As a Provider, I want to be able to post my profile, in order to be chosen for jobs.
As a User, I want to be able to review, in order to build a picture of reliability.
As a User, I want to be able to send messages, in order to coordinate the details of the job.
As an Admin, I want the app to use two factor authorisation, in order to secure access to the app.

## R13 - Wireframes for your app
<!-- CMP1042-6.2 More than five detailed and well designed wireframes provided, for several different screen sizes (as required for the app) -->
### Dashboard Views

![Dashboard](./docs/dashboard.png)

### Job Views

![Job Views](./docs/job_view.png)

## R14 - An ERD for your app
<!-- CMP1042-4.3 ERDs -->
<!-- PRG1048-1.1 ERD is complete with appropriately defined entities (models each serve a single purpose and appropriate fields) with no duplication and ideal definition of entities. -->
<!-- PRG1048-1.3 All tables, fields, and relationships adequately represent a highly optimised solution.. -->
![ERD](./docs/AndrewDuggan_T2A2_ERD.png)

## R15 - Explain the different high-level components (abstractions) in your app
<!-- CMP1042-1.2 understanding of the different high-level components of the app -->
CoderTradie is a two sided marketplace application that allows the users to post jobs and look at the tradies that can take the job, and allows tradies to view the jobs that they are able to undertake.

A rails applications uses both the Model View Controller (MVC) architecture as well as using convention over configuration principles.

The Controllers (ActionController) are a central hub of programming, acting as a connection between the model, view and receiving information from the web server via the routing table. They contain the primary queries and feed the information to the Views

The Views (Action view) are the front-end of the application, the display information to the web server for display to the user's browser using HTML. The standard rails view is HTML/CSS with embedded ruby code (.html.erb), this allows the html views to be fed data from the controller.

The Models (Active record) are responsible for the data and logic contained in the database, including validation and manipulation (including retrieving, adding, editing or updating and destroying them). The models use PostgreSQL.

## R16 - Detail any third party services that your app will use
<!-- CMP1042-1.3 detailed description of third party services used in the app -->
https://en.wikipedia.org/wiki/Cloudinary

[Cloudinary](https://www.cloudinary.com) is an online service that allows users to upload, store, manage, manipulate, and deliver images and video for websites and apps. It has its own Ruby Gem and creates and maintains its on database for use in an app.

[Heroku](https://www.heroku.com) is an application hosting website, though originally specialising in ruby, it has branched out and is now a polyglot platform. it has its own app and can operate in conjunction with GITHUB


## R17 - Describe your projects models in terms of the relationships (active record associations) they have with each other
<!-- CMP1042-3.3 discussion of the project’s models with an understanding of how its active record associations function -->

The user information is split up into four models as access to all of the information is not required for all actions:

### User model
Contains the logon information and links to the profile and roles models.
It has_one profile that is destroyed when the user is destroyed and has_many roles.

### Profile model
Contains the user information not required for logging in.
It belongs_to the user model, has_one address that is destroyed if profile is deleted, has_many jobs that will be destroyed if the profile is destroyed and has_many trades (through the profiles_trades join table)

### Address model
Contains the address portion of the user information that is only needed to allow the tradie to accept the job.
It belongs_to the user profile and has_one state.

### State model
This contains a list of the states for use by the address when it is being created.
It has_many addresses

### Role model
Contains the list of roles for use as authorisation
It has_and_belongs_to_many users (through users_roles join table)

### Job model
Contains the information on the various jobs, these will be accessed by users via the user.profile.jobs's and tradies via the user.profile.trades.jobs.
It has one profile and has many trades (through jobs_trades join table)

### Trade model
This contains a list of the trades for use in both the jobs and profiles tables.
It has many profiles (through the profiles_trades link table) and has many jobs (through the jobs_trades link table)

## R18 - Discuss the database relations to be implemented in your application
<!-- CMP1042-4.2 discussion of the database relations, with reference to the ERD -->

### User model
The user model contains a unique id that acts as the primary key.
role_ids is a foreign key that links to the users_roles table in a one or many relationship.
profile_id is a foreign key that links to the profiles table in a one and only one relationship.

### Profile model
Contains the user information not required for logging in.
It belongs_to the user model, has_one address that is destroyed if profile is deleted, has_many jobs that will be destroyed if the profile is destroyed and has_many trades (through the profiles_trades join table)

### Address model
Contains the address portion of the user information that is only needed to allow the tradie to accept the job.
It belongs_to the user profile and has_one state.

### State model
This contains a list of the states for use by the address when it is being created.
It has_many addresses

### Role model
Contains the list of roles for use as authorisation
It has_and_belongs_to_many users (through users_roles join table)

### Job model
Contains the information on the various jobs, these will be accessed by users via the user.profile.jobs's and tradies via the user.profile.trades.jobs.
It has one profile and has many trades (through jobs_trades join table)

### Trade model
This contains a list of the trades for use in both the jobs and profiles tables.
It has many profiles (through the profiles_trades link table) and has many jobs (through the jobs_trades link table)

<!-- ## R19 - Provide your database schema design -->

## R20 - Describe the way tasks are allocated and tracked in your project
<!-- CMP1042-6.3 planning for how tasks are planned and tracked, including a full description of the process and of the tools used -->
The inital stage was planned on pen and paper and through the creation of the ERD and wireframes.
The project management is primarily conducted on Trello; Unfortunately, most of the jobs were conducted simultaneously and most were completed at the same time. The final stage was the addition of the images to the Jobs and confirmation after uploading the app to Heroku.

<!-- # Slide Deck -->
<!-- be no longer than 10 minutes -->
<!-- utilise the submitted Slide deck -->

<!-- |No.|Requirement|
|:-:|:-:|
|R21|An outline of the problem you were trying to solve by building this particular marketplace app, and why it’s a problem that needs solving|
|R22|A walkthrough of your app| -->

<!-- #Application
PRG1048-1.2 Implemented models each serve a single purpose, contain appropriate fields and relationships with no duplication and ideal model implementation.
PRG1048-2.1 Controllers always provide correct information from the models to the application views elegantly (queries chosen are the most elegant to achieve the result).
PRG1048-2.2 All data needed for a working solution is available, demonstrating an understanding of database queries.
PRG1048-2.3 All queries are sufficiently and clearly commented and all comments are exceptionally written.
PRG1048-5.1 Identifies and uses appropriate model methods for querying on self and its relationships, extends models scope where appropriate.
PRG1048-5.2 Minimise all database calls and implement eager loading where appropriate
PRG1048-5.3 Validates and sanitises all input -->