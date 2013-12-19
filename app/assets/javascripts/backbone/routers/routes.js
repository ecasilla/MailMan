// root GET    /                                                     welcome#index
//                        about GET    /about(.:format)                                      welcome#about
//      campaign_email_template POST   /campaigns/:campaign_id/email_template(.:format)      email_templates#create
//  new_campaign_email_template GET    /campaigns/:campaign_id/email_template/new(.:format)  email_templates#new
// edit_campaign_email_template GET    /campaigns/:campaign_id/email_template/edit(.:format) email_templates#edit
//                              PATCH  /campaigns/:campaign_id/email_template(.:format)      email_templates#update
//                              PUT    /campaigns/:campaign_id/email_template(.:format)      email_templates#update
//          campaign_send_email POST   /campaigns/:campaign_id/send_email(.:format)          send_emails#create
//                              GET    /campaigns/:campaign_id/send_email(.:format)          send_emails#show
//               user_campaigns GET    /users/:user_id/campaigns(.:format)                   campaigns#index
//                              POST   /users/:user_id/campaigns(.:format)                   campaigns#create
//            new_user_campaign GET    /users/:user_id/campaigns/new(.:format)               campaigns#new
//                edit_campaign GET    /campaigns/:id/edit(.:format)                         campaigns#edit
//                     campaign GET    /campaigns/:id(.:format)                              campaigns#show
//                              PATCH  /campaigns/:id(.:format)                              campaigns#update
//                              PUT    /campaigns/:id(.:format)                              campaigns#update
//              user_recipients GET    /users/:user_id/recipients(.:format)                  recipients#index
//                              POST   /users/:user_id/recipients(.:format)                  recipients#create
//           new_user_recipient GET    /users/:user_id/recipients/new(.:format)              recipients#new
//                        users POST   /users(.:format)                                      users#create
//                     new_user GET    /users/new(.:format)                                  users#new
//                    edit_user GET    /users/:id/edit(.:format)                             users#edit
//                         user GET    /users/:id(.:format)                                  users#show
//                              PATCH  /users/:id(.:format)                                  users#update
//                              PUT    /users/:id(.:format)                                  users#update
//                              DELETE /users/:id(.:format)                                  users#destroy
//********************Routes**************************
// var router = Backbone.Router.extend({

//   routes: function() {
//     "/campaigns/:campaign_id/email_template/new" :"email_template"
//   },

//   email_template: function() {

//   }
// });