# metaco-ext

[![Gem version](https://badge.fury.io/rb/metaco-ext.svg)](https://rubygems.org/gems/metaco-ext)
[![Downloads](https://img.shields.io/gem/dt/metaco-ext?label=downloads)](https://rubygems.org/gems/metaco-ext)
[![CI](https://github.com/rbgfx/metaco-ext/actions/workflows/ci.yml/badge.svg)](https://github.com/rbgfx/metaco-ext/actions/workflows/ci.yml)
[![Ruby](https://img.shields.io/badge/ruby-%3E%3D3.1-CC342D?logo=ruby&logoColor=white)](https://www.ruby-lang.org/)
[![License](https://img.shields.io/badge/license-MIT-750014.svg)](LICENSE.txt)

> Small Ruby adapters for metaco textures, pixels, events, and resize data.

metaco-ext adds the Ruby-side helpers that sit next to the native
[metaco](https://github.com/rbgfx/metaco) API. Resource methods delegate to
metaco, while event helpers provide a stable, normalized shape for graphics
applications.

**[Features](#features) · [Installation](#installation) · [Quick start](#quick-start) · [Requirements](#requirements) · [Development](#development)**

## Features

- Texture create, update, bind, and destroy helpers.
- Compute and framebuffer pixel readback delegation.
- Frozen, symbol-keyed event normalization.
- Logical and framebuffer dimensions in resize events.
- No in-memory substitute for native texture resources.

## Installation

Add both gems to your Gemfile:

~~~ruby
gem "metaco"
gem "metaco-ext"
~~~

Then run:

~~~sh
bundle install
~~~

Or install the released extension:

~~~sh
gem install metaco-ext
~~~

## Quick start

~~~ruby
require "metaco/ext"

resize = Metaco::Ext.resize_event(
  width: 800,
  height: 450,
  framebuffer_width: 1600,
  framebuffer_height: 900
)

puts resize[:framebuffer_width]
~~~

Native texture operations require a metaco build with texture support:

~~~ruby
texture = Metaco::Ext.texture_create(handle, 2, 2, rgba_bytes)
Metaco::Ext.bind_compute_texture(handle, 0, texture)
~~~

## Requirements

Native Metal calls are available on macOS only. Calling a resource method
without a compatible metaco installation raises <code>LoadError</code>.

## Development

~~~sh
bundle install
bundle exec rake verify
~~~

## License

[MIT](LICENSE.txt)
