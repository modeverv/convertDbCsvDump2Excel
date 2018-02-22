# -*- coding:utf-8 -*-
###################################################
#
# SQL抽出結果CSVファイルなどをExcelで開けるようにする
# 入力 UTF-8 CRLF CSVを想定
#
###################################################
require 'kconv'
require 'date'

unless ARGV[0]
    puts "usage: ruby utf2sjis.rb <filename>"
    exit 1
end

target = ARGV[0]
output = "#{File.basename(target,File.extname(target))}_#{Date.today.strftime("%Y%m%d")}#{File.extname(target)}"

open(output,"w") do |wio|
    open(target,"r") do |rio|
        rio.each do |line|
            line = line.tosjis
            wio.puts(line)
        end
    end
end

puts "process has successfull finished"
exit 0



