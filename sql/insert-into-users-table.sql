INSERT INTO
    users (
        created_at,
        updated_at,
        activated_at,
        deactivated_at,
        hash,
        password,
        first_name,
        last_name,
        email,
        phone_number,
        country_code,
        extra
    )
VALUES
    (
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP,
        NULL,
        NULL,
        'f@ke@ssh@sh',
        'highly_INsecure!',
        'Roland',
        'Matthew',
        'cool.rolly@email.com',
        '516-892-1115',
        'US',
        '{"unique_detail": "unique_value"}'
    );
