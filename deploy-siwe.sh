dfx deploy ic_siwe_provider --argument $'(
    record {
        domain = "127.0.0.1";
        uri = "http://127.0.0.1:5173";
        salt = "anysalt";
        chain_id = opt 1;
        scheme = opt "http";
        statement = opt "Login to ck-PAY";
        sign_in_expires_in = opt 300000000000;
        session_expires_in = opt 604800000000000;
        targets = opt vec {
            "'$(dfx canister id ic_siwe_provider)'"; 
            "'$(dfx canister id assets)'"; 
        };
    }
)'
