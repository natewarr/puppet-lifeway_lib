#! /usr/bin/env ruby -S rspec
require 'spec_helper_acceptance'

describe 'hash_intersection function'
  describe 'success' do
    it 'intersections hashes' do
      pp = <<-EOS
      $a = {z => 1, y => 'test', x => [1,2,3]}
      $b = {y => 42, x => 'testing'}
      $c = { y => 'test', x => [1,2,3] }
      $o = hash_interesection($a,$b)
      if keys($o) == keys($c) and values($o) == values($c) {
        notify { 'output correct': }
      }
      EOS

      apply_manifest(pp, :catch_failures => true) do |r|
        expect(r.stdout).to match(/Notice output correct/)
      end
    end
    it 'intersections hash by array' do
      pp = <<-EOS
      $a = {z => 1, y => 'test', x => [1,2,3]}
      $b = ['y', 'x']
      $c = { y => 'test', x => [1,2,3] }
      $o = hash_interesection($a,$b)
      if keys($o) == keys($c) and values($o) == values($c) {
        notify { 'output correct': }
      }
      EOS

      apply_manifest(pp, :catch_failures => true) do |r|
        expect(r.stdout).to match(/Notice output correct/)
    end
  end
end
