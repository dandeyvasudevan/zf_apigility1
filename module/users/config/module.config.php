<?php
return array(
    'router' => array(
        'routes' => array(
            'users.rest.users' => array(
                'type' => 'Segment',
                'options' => array(
                    'route' => '/users[/:users_id]',
                    'defaults' => array(
                        'controller' => 'users\\V1\\Rest\\Users\\Controller',
                    ),
                ),
            ),
        ),
    ),
    'zf-versioning' => array(
        'uri' => array(
            0 => 'users.rest.users',
        ),
    ),
    'zf-rest' => array(
        'users\\V1\\Rest\\Users\\Controller' => array(
            'listener' => 'users\\V1\\Rest\\Users\\UsersResource',
            'route_name' => 'users.rest.users',
            'route_identifier_name' => 'users_id',
            'collection_name' => 'users',
            'entity_http_methods' => array(
                0 => 'GET',
                1 => 'PATCH',
                2 => 'PUT',
                3 => 'DELETE',
            ),
            'collection_http_methods' => array(
                0 => 'GET',
                1 => 'POST',
            ),
            'collection_query_whitelist' => array(),
            'page_size' => 25,
            'page_size_param' => null,
            'entity_class' => 'users\\V1\\Rest\\Users\\UsersEntity',
            'collection_class' => 'users\\V1\\Rest\\Users\\UsersCollection',
            'service_name' => 'users',
        ),
    ),
    'zf-content-negotiation' => array(
        'controllers' => array(
            'users\\V1\\Rest\\Users\\Controller' => 'HalJson',
        ),
        'accept_whitelist' => array(
            'users\\V1\\Rest\\Users\\Controller' => array(
                0 => 'application/vnd.users.v1+json',
                1 => 'application/hal+json',
                2 => 'application/json',
            ),
        ),
        'content_type_whitelist' => array(
            'users\\V1\\Rest\\Users\\Controller' => array(
                0 => 'application/vnd.users.v1+json',
                1 => 'application/json',
            ),
        ),
    ),
    'zf-hal' => array(
        'metadata_map' => array(
            'users\\V1\\Rest\\Users\\UsersEntity' => array(
                'entity_identifier_name' => 'ID',
                'route_name' => 'users.rest.users',
                'route_identifier_name' => 'users_id',
                'hydrator' => 'Zend\\Stdlib\\Hydrator\\ArraySerializable',
            ),
            'users\\V1\\Rest\\Users\\UsersCollection' => array(
                'entity_identifier_name' => 'ID',
                'route_name' => 'users.rest.users',
                'route_identifier_name' => 'users_id',
                'is_collection' => true,
            ),
        ),
    ),
    'zf-apigility' => array(
        'db-connected' => array(
            'users\\V1\\Rest\\Users\\UsersResource' => array(
                'adapter_name' => 'fxteam',
                'table_name' => 'users',
                'hydrator_name' => 'Zend\\Stdlib\\Hydrator\\ArraySerializable',
                'controller_service_name' => 'users\\V1\\Rest\\Users\\Controller',
                'entity_identifier_name' => 'ID',
                'table_service' => 'users\\V1\\Rest\\Users\\UsersResource\\Table',
            ),
        ),
    ),
);
