## Backend Features
- CodeIgniter 3.x included.
- Very flexible template/theme system, capable of Wordpress-like parent/child themes.
- Admin and Default themes, Fully modular and built around HMVC
- 4 ‘contexts’ ready for your code: Content, Reports, Settings and Developer Tools
- Database backup and maintenance interface
- Role-based access control
- Built-in users/auth system
- Code Builder with CRUD generation
- Simple email queue system
- Uses multiple-environment config files.
- Migration-ready (using either raw SQL or Database Forge commands)
- Log view/maintenance

# How to "install"
1. To start your own project development, Clone this repo .. or better .. fork this repo so you can contribute by pull request
2. By default, this cibonfired is run at http://localhost/cibonfired, if you cloned other than that eg: http://cibonfired (root not subfolder), make sure you edit the .htaccess and config.php to set the appropriate base_url (remove the "cibonfired" word)
3. Upload the cibonfired.sql (at /application/db/backups) to phpmyadmin to create "cibonfired" database or any other name that suitable for your project, be sure to check or change the database name at database.php in config folder
4. Open the cibonfired on your browser (http://localhost/cibonfired)
5. There are already 2 builtin default user with roles:
    * u: **admin@cms**, p: **password**  (admin role)
    * u: **dev@cms**, p: **password**  (developer role)
6. Have fun
