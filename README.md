# MVP SITE SALE

This is a demonstration of e-commerce site, so basically Admin can create the deal for any future date and those deal will get published through worker at 10:00 AM IST

For using the Site Sale feature, as user you need to signup first and then login to see the offer available for that day, as per the guidelines each user can buy the product in an offer at once only, so please go through it and share some feedback, thanks!


# About the Implementation

There are total 3 models created in project, each are associated with each other using belongs_to, has_many association, please check the models for more details
1. User
2. Deal
3. TransactionHistory

Some of the basic assumption is taken such as deal title length, description and having some custom validation at model also, to avoid inconsistent data in database


At Front End, HTML, CSS including bootstrap is used for having some interactive UI, given some of the basic front-end validation on deal form, you need to signup and login to go inside
