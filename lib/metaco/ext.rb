# frozen_string_literal: true

require_relative "ext/version"

module Metaco
  module Ext
    module_function

    def texture_create(handle, width, height, bytes, **options)
      native.texture_create(handle, width, height, bytes, **options)
    end

    def texture_update(texture, bytes)
      native.texture_update(texture, bytes)
    end

    def texture_destroy(texture)
      native.texture_destroy(texture)
    end

    def bind_compute_texture(handle, index, texture)
      native.bind_compute_texture(handle, index, texture)
    end

    def read_pixels(handle, source: :compute)
      native.read_pixels(handle, source: source)
    end

    def normalize_event(event)
      event = event.transform_keys(&:to_sym)
      event[:modifiers] = Array(event[:modifiers]).map(&:to_sym).freeze if event.key?(:modifiers)
      event.freeze
    end

    def resize_event(width:, height:, framebuffer_width: width, framebuffer_height: height)
      normalize_event(type: :resize, width: width, height: height, framebuffer_width: framebuffer_width, framebuffer_height: framebuffer_height)
    end

    def native
      require "metaco" unless Metaco.respond_to?(:texture_create)
      raise LoadError, "metaco with texture support is required" unless Metaco.respond_to?(:texture_create)
      Metaco
    end
    private_class_method :native
  end
end
