<VirtualHost %ip%:%web_port%>

    ServerName %domain_idn%
    %alias_string%
    ServerAdmin %email%
    DocumentRoot /var/lib/roundcube
    ScriptAlias /cgi-bin/ %home%/%user%/web/%domain%/cgi-bin/
    Alias /vstats/ %home%/%user%/web/%domain%/stats/
    Alias /error/ %home%/%user%/web/%domain%/document_errors/
    #SuexecUserGroup %user% %group%
    CustomLog /var/log/%web_system%/domains/%domain%.bytes bytes
    CustomLog /var/log/%web_system%/domains/%domain%.log combined
    ErrorLog /var/log/%web_system%/domains/%domain%.error.log
    <Directory /var/lib/roundcube>
        AllowOverride All
        Options +Includes -Indexes +ExecCGI
        php_admin_value open_basedir %docroot%:%home%/%user%/tmp:/var/lib:/usr/share/roundcube:/etc/roundcube:/var/log/roundcube:/tmp:/etc/hostname:/etc/mailname:/usr/share/php
        php_admin_value upload_tmp_dir %home%/%user%/tmp
        php_admin_value session.save_path %home%/%user%/tmp
    </Directory>
    <Directory %home%/%user%/web/%domain%/stats>
        AllowOverride All
    </Directory>

    IncludeOptional /etc/roundcube/apache.conf

</VirtualHost>

