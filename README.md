# README

## Steps to run

1. Install rvm, node, yarn and ruby

    - https://github.com/rvm/ubuntu_rvm (follow instructions to install step by step)
    - Install ruby: 
    ```
    rvm install ruby-2.6
    ```
    - Install node js
    ```
    sudo apt update && sudo apt-get install nodejs
    ```
   - Install yarn
   ```
   curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
   echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
   sudo apt update && sudo apt install yarn
   ```

2. Clone repository and enter directory:

    ```
    git clone https://gitlab.com/arnaucomellas/issue-tracker-asw-q1-2019.git
    cd issue-tracker-asw-q1-2019
    ```

3. Create gemset:

    ```
    rvm gemset create issue_tracker
    rvm --rvmrc ruby-2.6@issue_tracker
    # Refresh your directory:
    cd ..
    cd issue-tracker-asw-q1-2019
    # answer y to the question
    ```

4. Bundle install (might take a while):

    ```
    bundle install
    ```

5. Recreate database

    ```
    rake db:reset
    ```
    if this throws errors try ` rake db:drop db:create db:migrate` instead.
    
    You might need to run `yarn install --check-files` if it asks you to do so

6. Run server and/or console

    You should now be able to run the server with `rails server` and rails console with `rails console` or run the server from an IDE.

### Possible errors:

 - Listen error: unable to monitor directories for changes
 
    fix: `echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
`

## Done so far

1. Project was created using: `rails start issue-tracker`, it generated the basic structure of a ruby on rails app
2. Scaffolds:

    Basic for User, Priority and IssueType (just to get things working) and more complete for Issue

    ```
    rails g scaffold User username:string
    
    rails g scaffold Priority name:string
    
    rails g scaffold IssueType name:string
    
    rails g scaffold Issue title:string assignee:belongs_to priority:belongs_to issue_type:belongs_to description:text creator:belongs_to
    ```

3. Modified issue migration as belongs_to with foreing_key: true was giving errors
4. Modified some fields in issue's _form.html.erb (text_fields to select fields)

## Examples and how-to's

- Exemple create and find via rails console:

    ```
    # create two users, an issue_type and a priority
    User.create(username:"jacksparrow")
    User.create(username:"arnaucomellas")
    IssueType.create(name:"new_functionality")
    Priority.create(name:"low")
    
    # you can find records in different ways:
    User.find(1) # via id
    User.where(username:"jacksparrow").first # first with username arnaucomellas
    User.find_by_username("jacksparrow") # first with username arnaucomellas
    
    # find the users we created: (using variables here)
    creator = User.find_by_username("jacksparrow")
    assignee = User.find_by_username("arnaucomellas")
  
    # create an issue:
    Issue.create(   creator_id: creator.id,   assignee_id:   assignee.id,   priority:  Priority.find_by_name("low"), issue_type: IssueType.last, title: "blablabla", description:"blabalbalbalbalbalbablablabal")
    ```