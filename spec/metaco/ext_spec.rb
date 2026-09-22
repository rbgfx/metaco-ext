# frozen_string_literal: true

RSpec.describe Metaco::Ext do
  it "has a version number" do
    expect(Metaco::Ext::VERSION).not_to be nil
  end

  it "delegates resource operations to the native metaco API" do
    texture = Object.new
    bytes = "\0\0\0\xff".b
    allow(Metaco).to receive(:texture_create).with(:handle, 1, 1, bytes).and_return(texture)
    expect(Metaco).to receive(:texture_update).with(texture, bytes)
    expect(Metaco).to receive(:bind_compute_texture).with(:handle, 0, texture)
    expect(Metaco).to receive(:texture_destroy).with(texture)
    expect(Metaco).to receive(:read_pixels).with(:handle, source: :compute).and_return(bytes)

    expect(Metaco::Ext.texture_create(:handle, 1, 1, bytes)).to be(texture)
    Metaco::Ext.texture_update(texture, bytes)
    Metaco::Ext.bind_compute_texture(:handle, 0, texture)
    Metaco::Ext.texture_destroy(texture)
    expect(Metaco::Ext.read_pixels(:handle)).to eq(bytes)
  end

  it "normalizes resize events" do
    event = Metaco::Ext.resize_event(width: 10, height: 8, framebuffer_width: 20, framebuffer_height: 16)

    expect(event).to include(type: :resize, framebuffer_width: 20)
  end
end
