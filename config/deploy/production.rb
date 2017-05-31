set :stage, :production
set :rails_env, :production

role :app,   %w{ app@13.113.198.184 }
role :web,   %w{ app@13.113.198.184 }
role :db,    %w{ app@13.113.198.184 }
