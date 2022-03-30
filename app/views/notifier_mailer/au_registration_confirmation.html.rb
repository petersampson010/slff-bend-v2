<!DOCTYPE html>
<html>
  <head>
    <meta content='text/html; charset=UTF-8' http-equiv='Content-Type' />
  </head>
  <body>
    <h1>Welcome to example.com, <%= @admin_user.email %></h1>
    <p>
      You have successfully signed up to example.com,
      your username is: <%= @admin_user.user_name %>.<br>
    </p>
    <p>
      To login to the site, just follow this link: <%= confirm_email_admin_user_url(@admin_user.confirm_token) %>.
    </p>
    <p>Thanks for joining and have a great day!</p>
  </body>
</html>
