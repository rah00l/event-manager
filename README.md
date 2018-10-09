# EVENT-MANAGER

rails g model event name title description:text starts_at:datetime ends_at:datetime

rails g model user name email phone 

rails g model event_user event:references user:references

rails g controller events index new edit