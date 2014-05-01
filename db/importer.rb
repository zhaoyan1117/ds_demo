require 'csv'
require_relative 'row'

class Importer
  def initialize(file)
    @file = file
  end

  def import_data
    first_line = true
    line_count = 1

    CSV.foreach(@file, encoding: "iso-8859-1:UTF-8") do |r|
       import_row(Row.new(r)) unless first_line
       first_line = false

       puts "#{line_count} line(s) have been processed."
       line_count += 1
    end
  end

  def import_row(row)
    company = find_or_create_company row
    investor = find_or_create_investor row
  end

  def find_or_create_company(row)
    company = Company.find_or_create_by permalink: row.company_permalink
    company.update_attributes_if_nil! row.company_attributes
    company
  end

  def find_or_create_investor(row)
    investor = Investor.find_or_create_by permalink: row.investor_permalink
    investor.update_attributes_if_nil! row.investor_attributes
    investor
  end
end
