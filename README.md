# Faceauth
Faceauth gem is a simple plugin which allows users to sign into any rails based web application using their face. Primarily supporting devise authentication (Please refer [Devise gem](https://github.com/plataformatec/devise)), this gem uses [FindFace Cloud API](https://findface.pro/en/) to run the face matches & authenticate users. This is aimed at simplifying the user authentication by eliminating the need to remember the passwords for multiple websites a user might be using.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'faceauth'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install faceauth
```

Next, you need to run the generator:
```bash
$ rails generate faceauth:install
```


## Embedding in a Rails app

Add the following to your routes.rb file:

``` ruby
mount Faceauth::Engine, at: "/"
```

(**Note:** You may mount the server at any path, not just at "/")

Add two columns using migration to your devise user model in rails application. Example for column names: user_picture, last_sign_in_picture

And run migrations:

```bash
$ rake db:migrate
```

Generate devise views: (Assumption that you are already using devise gem for authentication platform in your rails application)

```bash
rails generate devise:views
```

add the following in devise/shared/_links.html.erb file.

``` erb
<%= link_to "Log in using your face", faceauth.new_session_path %><br />
```
(**Note:** Ensure to setup process of recording user picture during signup process and store details in :user_picture column.)

Next, setup the configuration:

Open your initializers file at config/initializers/faceauth.rb where you can configure settings for faceauth as follows:

```ruby
Faceauth.configuration do |config|
  config.model_name = "user"
  config.uploader_name = "carrierwave"
  config.redirect_url = "root_path"
  config.findface_api_key = "YOUR_API_KEY"
  config.signup_picture_column = "user_picture"
  config.signin_picture_column = "last_sign_in_picture"
  config.email_column = "email"
end 
```

The options available are:

| Option                    | Description                                                                         | Default Values                              |
| -----------------         | -------------------------------                                                     | --------------------------------            |
| `model_name`              | String to set devise user model .                                                   | "user"                                      |
| `uploader_name`           | String to define attachments plugin used to store images.                           | "carrierwave" or "paperclip"                |
| `redirect_url`            | String to provide location details for taking user after successful authentication. | "root_path"                                 |
| `findface_api_key`        | String to set Findface API Key.                                                     | "Findface API key"                          |
| `email_column`            | set column name where user email is stored                                          | "email"                                     |
| `signup_picture_column`   | set column name where user picture is stored                                        | "user_picture"                              |
| `signin_picture_column`   | set column name where user picture is stored recorded from faceauth sign in page    | "last_sign_in_picture"                      |


Ensure you have set 'findface_api_key' and 'redirect_url' in config/initializers/faceauth.rb

```ruby
config.findface_api_key = "YOUR_API_KEY"
config.redirect_url = "root_path" #By default, the option takes root_path of your rails application.
```
If you wish to pass your custom model name & column names, please set the names using

```ruby
config.model_name = "your_model_name"
config.signup_picture_column = "custom_column_name"
config.signin_picture_column = "custom_column_name"
```

Start using the gem 🙂


**Note:**

In development environment please use [ngrok](https://ngrok.com/) with https protocol. As per the security standards & protocols access to microphones & webcames are allowed only through a secure channel.

## Customization

We built Faceauth to help you quickly integrate form in your application. However, we don't want to be in your way when you need to customize it.

Since Faceauth is an Rails engine, all its views are packaged inside the gem. These views will help you get started, but after some time you may want to change them. If this is the case, you just need to invoke the following generator, and it will copy all views to your application:

```console
$ rails generate faceauth:views
```

If you would like to generate only a few sets of views, like the ones for the `form`
you can pass a list of names to the generator with the `-v` flag.

```console
$ rails generate faceuath:views -v form
```

## Testing

After checking out the repo, run bundle to install dependencies. Then, run rspec spec to run the tests, from 'dummy' app under test suite.

## Todos

1. Extending this functionality for other authentication plugins.
2. Support for ruby versions < 2.2.2 .
3. Writing more test cases.
4. Making signin process faster. i.e. The response time of Jpeg_camera gem we use to capture picture is slow. Need to make it faster such that it improves overall user experience. 
5. User will be able to login by showing a hardcopy of photo instead of showing his face to webcam which allows successful authentication. Need to explore on this to avoid this scneario to make it more efficient and authentic. 
6. Need to check system behaviour in assuming Twins in users base and find fixes for any issues observed.
7. Adding security question system will eliminate the use cases 5 & 6 after immediate positive verification, however this addition should not hammer user experience. Need to design very intutive & flexible user sign in flow. 
  

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/faceauth. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

Please ensure to follow the following steps as standard practice to contribute:

1. Fork it ([https://github.com/M-S-D-P/findface-master/fork](https://github.com/M-S-D-P/findface-master/fork))
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Authored by

Sandeep M

# findface-master
