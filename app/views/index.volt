<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        {{ get_title() }}
        {{ stylesheet_link('css/bootstrap.min.css') }}
    </head>
    <body>
        {{ content() }}
        {{ javascript_include('js/bootstrap.min.js') }}
    </body>
</html>
