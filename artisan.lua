--
-- Copyright (c) 2014 Shengyou Fan
--

--------------------------------------------------------------------------------
local function flags(...)
    local p = clink.arg.new_parser()
    p:set_flags(...)
    return p
end

local artisan_basic_options = {
    "--help", "-h",
    "--quiet", "-q",
    "--version", "-V",
    "--ansi",
    "--no-ansi",
    "--no-interaction", "-n",
    "--env",
    "--verbose", "-v", "-vv", "-vvv",
}

local artisan_basic_parser = clink.arg.new_parser()
artisan_basic_parser:set_flags(artisan_basic_options)
artisan_basic_parser:set_arguments({
    "clear-compiled",
    "down",
    "env",
    "help",
    "horizon",
    "inspire",
    "list",
    "migrate",
    "optimize",
    "serve",
    "test",
    "tinker",
    "up",
})

local artisan_command_parser = clink.arg.new_parser()
artisan_command_parser:set_arguments({
    "app:name" .. flags(artisan_basic_options),
    -- auth
    "auth:clear-resets" .. flags(artisan_basic_options),
    -- cache
    "cache:clear" .. flags(artisan_basic_options),
    "cache:forget" .. flags(artisan_basic_options),
    "cache:table" .. flags(artisan_basic_options),
    -- command
    "command:name" .. flags(artisan_basic_options),
    -- config
    "config:cache" .. flags(artisan_basic_options),
    "config:clear" .. flags(artisan_basic_options),
    -- covid
    "covid:questionnaire:escalation-report" .. flags(
        "--management_level",
        "--timezone",
        artisan_basic_options
    ),
    "covid:questionnaire:generate" .. flags(artisan_basic_options),
    "covid:questionnaire:hr-report" .. flags(
        "--timezone",
        artisan_basic_options
    ),
    "covid:questionnaire:manager-report" .. flags(
        "--timezone",
        artisan_basic_options
    ),
    "covid:questionnaire:security-report" .. flags(
        "--management_level",
        "--timezone",
        artisan_basic_options
    ),
    "covid:questionnaire:vp-hr-report" .. flags(artisan_basic_options),
    "covid:questionnaires:generate" .. flags(
        "--timezone",
        artisan_basic_options
    ),
    "covid:suspensions:check" .. flags(artisan_basic_options),
    -- db
    "db:download" .. flags(artisan_basic_options),        
    "db:import" .. flags (
        "--only",
        "--except",
        "--migrate",
        "--views",
        artisan_basic_options
    ),
    "db:prune" .. flags(artisan_basic_options),                         
    "db:stash" .. flags(artisan_basic_options),
    "db:stash:pop" .. flags(artisan_basic_options),
    "db:seed" .. flags(
                        "--class",
                        "--database",
                        "--force",
                        artisan_basic_options
                        ),
   "db:sync" .. flags(
        "--preset",
        artisan_basic_options
    ),
    "db:system-views:clear" .. flags(artisan_basic_options),
    "db:system-views:prepare" .. flags(artisan_basic_options),
    "db:test" .. flags(
        "--clear",
        "--import-only",
        "--dump-only",
        "--no-prefix",
        "--no-drop",
        "--force",
        artisan_basic_options
        ),
    "db:test:create-base-model-test" .. flags(artisan_basic_options),
    "db:views:clear" .. flags(artisan_basic_options),
    "db:views:prepare" .. flags(artisan_basic_options),
    "db:wipe" .. flags(artisan_basic_options),
    -- document-approval
    "document-approval:migrate" .. flags(artisan_basic_options),
    -- enum
    "enum:annotate" .. flags(artisan_basic_options),
    -- event
    "event:cache" .. flags(artisan_basic_options),
    "event:clear" .. flags(artisan_basic_options),
    "event:generate" .. flags(artisan_basic_options),
    "event:list" .. flags(artisan_basic_options),
    -- generate
    "generate:missing-documents" .. flags(
        "--paths",
        "--chunk",    
        artisan_basic_options
    ),
    "generate:page-enum" .. flags(artisan_basic_options),
    "generate:permission-enum" .. flags(artisan_basic_options),
    -- horizon
    "horizon:clear" .. flags(artisan_basic_options),
    "horizon:continue" .. flags(artisan_basic_options),
    "horizon:forget" .. flags(artisan_basic_options),
    "horizon:install" .. flags(artisan_basic_options),
    "horizon:list" .. flags(artisan_basic_options),
    "horizon:pause" .. flags(artisan_basic_options),
    "horizon:publish" .. flags(artisan_basic_options),
    "horizon:purge" .. flags(artisan_basic_options),
    "horizon:snapshot" .. flags(artisan_basic_options),
    "horizon:status" .. flags(artisan_basic_options),
    "horizon:supervisors" .. flags(artisan_basic_options),
    "horizon:terminate" .. flags(artisan_basic_options),
    -- key
    "key:generate" .. flags(
        "--show",
        artisan_basic_options
        ),
    -- make
    "make:cast" .. flags(artisan_basic_options),
    "make:channel" .. flags(artisan_basic_options),
    "make:command" .. flags(artisan_basic_options),
    "make:component" .. flags(artisan_basic_options),
    "make:controller" .. flags(
                        "--resource",
                        artisan_basic_options
                        ),
    "make:enum" .. flags(artisan_basic_options),
    "make:event" .. flags(artisan_basic_options),
    "make:exception" .. flags(artisan_basic_options),
    "make:export" .. flags(artisan_basic_options),
    "make:factory" .. flags(artisan_basic_options),
    "make:import" .. flags(artisan_basic_options),
    "make:job" .. flags(
                        "--queued",
                        artisan_basic_options
                        ),
    "make:listener" .. flags(
                        "--event",
                        "--queued",
                        artisan_basic_options
                        ),
    "make:mail" .. flags(artisan_basic_options),
    "make:middleware" .. flags(artisan_basic_options),
    "make:migration" .. flags(
                        "--create",
                        "--table",
                        artisan_basic_options
                        ),
    "make:model" .. flags(
                        "--migration", "-m",
                        "--table",
                        artisan_basic_options
                        ),
    "make:notification" .. flags(artisan_basic_options),
    "make:observer" .. flags(artisan_basic_options),
    "make:policy" .. flags(artisan_basic_options),
    "make:provider" .. flags(artisan_basic_options),
    "make:request" .. flags(artisan_basic_options),
    "make:rule" .. flags(artisan_basic_options),
    "make:seeder" .. flags(artisan_basic_options),
    "make:test" .. flags(
        "--unit",
        artisan_basic_options
    ),
    -- migrate
    "migrate:fresh" .. flags(artisan_basic_options),
    "migrate:install" .. flags(
                        "--database",
                        artisan_basic_options
                        ),
    "migrate:refresh" .. flags(
                        "--database",
                        "--force",
                        "--seed",
                        "--seeder",
                        artisan_basic_options
                        ),
    "migrate:reset" .. flags(
                        "--database",
                        "--force",
                        "--pretend",
                        artisan_basic_options
                        ),
    "migrate:rollback" .. flags(
                        "--database",
                        "--force",
                        "--pretend",
                        artisan_basic_options
                        ),
    "migrate:status" .. flags(
                        "--database",
                        "--path",
                        artisan_basic_options
                        ),
    -- notifications
    "notifications:table" .. flags(artisan_basic_options),
    -- optimize        
    "optimize:clear" .. flags(artisan_basic_options),        
    -- package
    "package:discover" .. flags(artisan_basic_options), 
    -- passport
    "passport:client" .. flags(artisan_basic_options),   
    "passport:hash" .. flags(artisan_basic_options),   
    "passport:install" .. flags(
        "--force",
        artisan_basic_options
    ),   
    "passport:keys" .. flags(artisan_basic_options),   
    "passport:purge" .. flags(
        "--expired",
        artisan_basic_options
    ), 
    -- permission
    "permission:cache-reset" .. flags(artisan_basic_options),   
    "permission:create-permission" .. flags(artisan_basic_options),   
    "permission:create-role" .. flags(artisan_basic_options),   
    "permission:show" .. flags(artisan_basic_options),   
    -- permissions  
    "permissions:re-sequence" .. flags(artisan_basic_options),  
    -- queue 
    "queue:batches-table" .. flags(artisan_basic_options),
    "queue:clear" .. flags(artisan_basic_options),
    "queue:failed" .. flags(artisan_basic_options),
    "queue:failed-table" .. flags(artisan_basic_options),
    "queue:flush" .. flags(artisan_basic_options),
    "queue:forget" .. flags(artisan_basic_options),
    "queue:listen" .. flags(
                        "--queue",
                        "--delay",
                        "--memory",
                        "--timeout",
                        "--sleep",
                        "--tries",
                        artisan_basic_options),
    "queue:restart" .. flags(artisan_basic_options),
    "queue:retry" .. flags(artisan_basic_options),
    "queue:table" .. flags(artisan_basic_options),
    "queue:work" .. flags(
                        "--queue",
                        "--daemon",
                        "--delay",
                        "--force",
                        "--memory",
                        "--sleep",
                        "--tries",
                        artisan_basic_options),
    -- route
    "route:cache" .. flags(artisan_basic_options),
    "route:clear" .. flags(artisan_basic_options),
    "route:list" .. flags(
                        "--name",
                        "--path",
                        artisan_basic_options
                        ),
    -- sales-orders
    "sales-orders:sync" .. flags(artisan_basic_options),
    -- schedule
    "schedule:run" .. flags(artisan_basic_options),
    "schedule:work" .. flags(artisan_basic_options),
    -- schema
    "schema:dump" .. flags(artisan_basic_options),
    -- security
    "security:prepare" .. flags(artisan_basic_options),
    -- session
    "session:table" .. flags(artisan_basic_options),
    -- stub
    "stub:publish" .. flags(artisan_basic_options),
    -- telescope
    "telescope:clear" .. flags(artisan_basic_options),
    "telescope:install" .. flags(artisan_basic_options),
    "telescope:prune" .. flags(artisan_basic_options),
    "telescope:publish" .. flags(artisan_basic_options),
    -- twilio
    "twilio:call" .. flags(artisan_basic_options),
    "twilio:send" .. flags(artisan_basic_options),
    "twilio:sms" .. flags(artisan_basic_options),
    -- upload
    "upload:temp-files" .. flags(
        "--fixed-timestamp",
        artisan_basic_options
    ),
    -- users
    "users:populate-password" .. flags(artisan_basic_options),
    -- vendor
    "vendor:publish" .. flags(
                        "--force",
                        "--provider",
                        "--tag",
                        artisan_basic_options
                        ),
    -- view
    "view:cache" .. flags(artisan_basic_options),
    "view:clear" .. flags(artisan_basic_options),
})

clink.arg.register_parser("art", artisan_basic_parser)
clink.arg.register_parser("art", artisan_command_parser)
