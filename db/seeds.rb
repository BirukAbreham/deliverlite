# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Contact.destroy_all
ContactActivity.destroy_all
# Campaign.destroy_all
# CampaignActivity.destroy_all
Group.destroy_all
# Segment.destroy_all
# SegmentRule.destroy_all
# CustomField.destroy_all
# ContactCustomField.destroy_all
# SegmentRuleCustomField.destroy_all

contacts_list = FactoryBot.create_list(:contact, 2)

activity_one = FactoryBot.create(:contact_activity, contact: contacts_list.first)
activity_two = FactoryBot.create(:contact_activity, contact: contacts_list.first)
activity_thr = FactoryBot.create(:contact_activity, contact: contacts_list.last)
activity_for = FactoryBot.create(:contact_activity, contact: contacts_list.last)

groups_list = FactoryBot.create_list(:group, 2)

contacts_list.first.groups << groups_list.first
contacts_list.first.groups << groups_list.last
contacts_list.last.groups << groups_list.first
