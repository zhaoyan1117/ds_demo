# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'
require 'ostruct'
require 'delegate'

class Row < SimpleDelegator

  def initialize(row)
    super
    @delegate_sd_obj = build_struct row
  end

  def __getobj__
    @delegate_sd_obj
  end

  def __setobj__(obj)
    @delegate_sd_obj = obj
  end

  def build_struct(row)
    OpenStruct.new({
      company_permalink: row[0],
      company_name: row[1],
      company_category_code: row[2],
      company_country_code: row[3],
      company_state_code: row[4],
      company_region: row[5],
      company_city: row[6],
      investor_permalink: row[7],
      investor_name: row[8],
      investor_category_code: row[9],
      investor_country_code: row[10],
      investor_state_code: row[11],
      investor_region: row[12],
      investor_city: row[13],
      funding_round_type: row[14],
      funded_at: row[15],
      funded_month: row[16],
      funded_quarter: row[17],
      funded_year: row[18],
      raised_amount_usd: row[19]
    })
  end
end

class Importer
  def initialize(file)
    @file = file
  end

  def import_data!
    first_line = true

    CSV.foreach(@file, encoding: "iso-8859-1:UTF-8") do |r|
       import_row!(Row.new(r)) unless first_line
       first_line = false
    end
  end

  def import_row!(row)
    p row
  end
end

Importer.new("#{Rails.root}/db/data.csv").import_data!
