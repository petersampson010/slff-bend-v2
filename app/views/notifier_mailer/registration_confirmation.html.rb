<!DOCTYPE html>
<html>
  <head>
    <meta content='text/html; charset=UTF-8' http-equiv='Content-Type' />
  </head>
  <body>
    <h1>Welcome to example.com, <%= @user.email %></h1>
    <p>
      You have successfully signed up to example.com,
      your username is: <%= @user.user_name %>.<br>
    </p>
    <p>
      To login to the site, just follow this link: <%= confirm_email_user_url(@user.confirm_token) %>.
    </p>
    <p>Thanks for joining and have a great day!</p>
  </body>
</html>
