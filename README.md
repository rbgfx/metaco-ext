# metaco-ext

> Ruby adapters for metaco textures, pixels, events, and resize data.

[![Gem version](https://badge.fury.io/rb/metaco-ext.svg)](https://rubygems.org/gems/metaco-ext) [![Downloads](https://img.shields.io/gem/dt/metaco-ext?label=downloads)](https://rubygems.org/gems/metaco-ext) [![Ruby](https://img.shields.io/badge/ruby-%3E%3D3.1-CC342D?logo=ruby&logoColor=white)](https://www.ruby-lang.org/) [![CI](https://github.com/rbgfx/metaco-ext/actions/workflows/main.yml/badge.svg)](https://github.com/rbgfx/metaco-ext/actions/workflows/main.yml) [![License](https://img.shields.io/badge/license-MIT-750014.svg)](LICENSE.txt)

**[Features](#features) · [Installation](#installation) · [Requirements](#requirements) · [Quick start](#quick-start) · [Development](#development) · [License](#license) · [Website](https://rbgfx.github.io/metaco-ext/)**

---

metaco-ext adds Ruby-side helpers around the native metaco API. Resource calls delegate to metaco; event helpers provide normalized data.

## Features

- Texture create, update, bind, and destroy helpers.
- Compute and framebuffer pixel readback delegation.
- Frozen, symbol-keyed event normalization.
- Logical and framebuffer dimensions in resize events.
- No in-memory substitute for native texture resources.

## Installation

Add the extension to your Gemfile:

~~~ruby
gem "metaco-ext"
~~~

For native resource methods on macOS, add metaco too:

~~~ruby
gem "metaco"
~~~

Then run `bundle install`, or install the gem directly:

~~~sh
gem install metaco-ext
~~~

On macOS, install both gems for native resource methods:

~~~sh
gem install metaco metaco-ext
~~~

## Requirements

- Ruby 3.1 or newer.
- Native resource methods require a compatible metaco installation and are available on macOS only. Calls without metaco raise <code>LoadError</code>.

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

## Development

~~~sh
bundle install
bundle exec rake verify
~~~

## License

[MIT](LICENSE.txt)
