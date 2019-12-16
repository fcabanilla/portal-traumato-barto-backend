            SELECT
                  dni
                , first_name
                , last_name
                , username
                , password
                , email
                , sex
                , alternative_email
                , erased
                , r.description AS role
            FROM mydb.person p  
            INNER JOIN user u on u.idPerson = p.idperson
            INNER JOIN user_role ur on ur.iduser = u.iduser
            INNER JOIN role r on ur.iduser_role = r.iduser_role;