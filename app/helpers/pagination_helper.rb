module PaginationHelper
    def custom_paginate(collection)
      return unless collection.respond_to?(:current_page)
      
      content_tag :div, class: 'd-flex justify-content-center' do
        content_tag :ul, class: 'pagination' do
          previous_page(collection) + 
          page_numbers(collection) + 
          next_page(collection)
        end
      end
    end
    
    private
    
    def previous_page(collection)
      if collection.prev_page
        content_tag :li, class: 'page-item' do
          link_to 'Previous', {page: collection.prev_page}, class: 'page-link'
        end
      else
        content_tag :li, class: 'page-item disabled' do
          content_tag :span, 'Previous', class: 'page-link'
        end
      end
    end
    
    def next_page(collection)
      if collection.next_page
        content_tag :li, class: 'page-item' do
          link_to 'Next', {page: collection.next_page}, class: 'page-link'
        end
      else
        content_tag :li, class: 'page-item disabled' do
          content_tag :span, 'Next', class: 'page-link'
        end
      end
    end
    
    def page_numbers(collection)
      html = ''
      (1..collection.total_pages).each do |page|
        html += if page == collection.current_page
                  content_tag :li, class: 'page-item active' do
                    link_to page, {page: page}, class: 'page-link'
                  end
                else
                  content_tag :li, class: 'page-item' do
                    link_to page, {page: page}, class: 'page-link'
                  end
                end
      end
      html.html_safe
    end
  end