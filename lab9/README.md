# CS 262 - Lab 9
# Date: Nov 9, 2024

This lab is based on https://cs.calvin.edu/courses/cs/262/kvlinden/09is/lab.html

hacks that I had to make: Using the Monopoly data service as a model, create a data service for your own monopoly database (from labs 7 & 8) and deploy it on Azure.

This is the data service application for the 
[CS 262 sample Monopoly project](https://github.com/Sylviali4/monopoly-service),
 which is deployed here:
          
- <https://cs262-monopoly-service-g4cjahhxgze8a2a8.eastus2-01.azurewebsites.net/>

It has the following read data route URLs:
- `/` a hello message
- `/players` a list of players
- `/players/:id` a single player with the given ID

It is based on the standard Azure App Service tutorial for Node.js.

- <https://learn.microsoft.com/en-us/azure/app-service/quickstart-nodejs?tabs=linux&pivots=development-environment-cli>  

The database is relational with the schema specified in the `sql/` sub-directory
and is hosted on [Azure PostgreSQL](https://azure.microsoft.com/en-us/products/postgresql/).
The database server, user and password are stored as Azure application settings so that they 
aren&rsquo;t exposed in this (public) repo.

We implement this sample service as a separate repo to simplify Azure integration;
it&rsquo;s easier to auto-deploy a separate repo to Azure. For your team project&rsquo;s 
data service, configure your Azure App Service to auto-deploy from the master/main branch 
of your service repo. See the settings for this in the &ldquo;Deployment Center&rdquo; 
on your Azure service dashboard.
 
