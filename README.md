Travenor
---------

	This is the official repository for the Travel App, a comprehensive platform to manage trips, interact with a travel assistant chatbot, and personalize your travel experience. The application is divided into three main repositories: the main Rails app , the backend app for prompt generation and one for the AI

Table of Contents
-----------------

	 - Prerequisites
	 - Installation
	 - Setting Up the Main Rails App
	 - Setting Up the Backend App for Prompt Generation
	 - Running the Application
	 - AI App


Prerequisites
-------------

	Before setting up the application, ensure you have the following installed:

	Ruby: Version 3.1.2 or above
	Rails: Version 6.1.7 or above
	RVM (Ruby Version Manager)
	Node.js: Version 14.x or above
	Yarn
	SQLite3 and PostgreSQL 

Installation
-------------

	Setting Up the Main Rails App

	Install RVM (Ruby Version Manager):
	 - \curl -sSL https://get.rvm.io | bash -s stable


	After installation, load RVM:
	 - source ~/.rvm/scripts/rvm
	


	Verify installation:
	- rvm -v



  - Install Ruby


		Install Ruby version specified in the .ruby-version file:

		- rvm install 3.1.2
		- rvm use 3.1.2 --default

		Verify installation:
		- ruby -v



Setting Up the Main Rails App
-----------------------------

  - Clone the Repository

		
		- git clone https://github.com/ayshabaij/ai_travel_companion.git
		- cd ai_travel_companion

  - Install Bundler and Dependencies

	
		- gem install bundler
		- bundle install

  - Install Node.js and Yarn

		
		Install Node.js:
		- sudo apt-get install -y nodejs
		
		Install Yarn:
		- npm install --global yarn

  - Verify installations


		- node -v
		- yarn -v 

  - rails assets:precompile 

  - Set Up Environment Variables


		Fill in your variables in the .env file:

		Mailtrap is used for email sending functionalities. The keys are generated from Mailtrap. 
		To generate a Mailtrap API key, sign up on Mailtrap, go to the "SMTP Settings" page, and copy the username and password provided under the "API/SMTP Integration" section.

		MAILTRAP_USERNAME=''
		MAILTRAP_PASSWORD=''


		UPSTAGE_API_KEY='' # The Upstage API key
        API_KEY=''  # Google location API key

        To generate a Google API key, go to the Google Cloud Console, create a new project, enable the required APIs (like Geocoding API), and create an API key under "APIs & Services" > "Credentials".

  - Database Setup


		Create and migrate the database:
		- rails db:create
		- rails db:migrate
		- rails db:seed


Setting Up the Backend App for Prompt Generation
------------------------------------------------


  - Clone the Repository

     git clone https://github.com/ayshabaij/travel_app_backend.git
     cd travel-app-backend

  - Install RVM and Ruby

        - rvm install 3.1.2
		- rvm use 3.1.2 --default

		Verify installation:
		- ruby -v

  - Install Bundler and Dependencies

     - gem install bundler
     - bundle install

  - setup db datas
     ruby init_db.rb
     ruby populate_db.rb

  - secret keys -

    Add secret keys for API_KEY (same Google API key used in the main Rails app) and api_token (pre-database API key) by searching (cmd+f) and pasting (cmd+v) in the index.rb.

Running the Application
------------------------

  	Main Rails App:

       	To start the Rails server, run:  

       	- rails server

        - Visit http://localhost:3000 to access the application.

    Backend App:

         ruby app.rb 
         ruby index.rb (in another terminal)

AI App
-------

  Git repo - https://github.com/Kwth123/UpstageAiHackathon

  FIne Tuning doc -  https://colab.research.google.com/drive/1WrM_mfupNIVE7RL8SGL5P8z6EUySHJKb?usp=drive_link
 

More Info
---------

Location recomendation system uses Predibase solar model , https://app.predibase.com/ - implemented in backend app - travel_app_backend/index.rb


Chatbot used solar model from upstage website https://console.upstage.ai/login?redirect=%2Fapi-keys - Implemented in the main rails app - app/controller/pages_controller.rb
