module FacebookSocialPlugins::Plugin
	class Social < UiHelper

		attr_reader :options

		def initialize options = {}
			@options = options
			validate!
		end

		def render
			content_tag :div, '', render_options.merge(:class => plugin_class)
		end

		# the :special type indicates call to special type validator
		def validate!
			return if options.empty?
			valid_options = {}
			options.each do |key, value|
				attr_key = find_att_key(key)
				raise ArgumentError, "Unknown or unsupported attribute #{key}" unless attr_key
				attributes[attr_key] == :special ? send("validate_#{key.to_s.underscore}", value) : valid?(value, attributes[attr_key])
				valid_options[attr_key] = value
			end
			@options = valid_options
		end

		protected

		def layouts
			['standard', 'button_count', 'box_count']
		end

		def sizes
			['small', 'large']
		end

		def fonts
			['arial', 'lucida grande', 'segoe ui', 'tahoma', 'trebuchet ms', 'verdana']
		end

		def colorschemes
			['light', 'dark']
		end

		def linktargets
			['_top', '_parent']
		end

		def find_att_key key
			return key if attributes[key]
			key = key.to_s.dasherize.to_sym			
			return key if attributes[key]
			key = key.to_s.underscore.to_sym
			key if attributes[key]
		end

		# :width => 200 mapped to become 'data-width' => 200
		def render_options
			options.inject({}) {|res, opt| res["data-#{opt.first}"] = opt.last; res}
		end

		def plugin_class
			raise NotImplementedError, 'Must be implemented by subclass'
		end

		def attributes
			@attributes ||= {:id => :string, :style => :string}
		end

		def valid? value, valid_type
			case valid_type
			when :string
				raise ArgumentError, "Must be a String, was #{value}" unless string?(value)
			when :array
				raise ArgumentError, "Must be an Array or a String, was #{value}" unless array?(value)
			when :integer
				raise ArgumentError, "Must be a Fixnum, was #{value}" unless integer?(value)
			when :boolean
				raise ArgumentError, "Must be a Boolean, was #{value}" unless boolean?(value)
			when Array
				raise ArgumentError, "Must be a one of #{valid_type.inspect}, was #{value}" unless valid_type.include?(value.to_s)
			end
		end

		def string? value
			value.is_a?(String) || value.is_a?(Symbol)
		end

		def array? value
			value.is_a?(String) || value.is_a?(Symbol) || value.is_a?(Array)
		end

		def integer? value
    	value.is_a?(Fixnum) && value > 0
    end

		def boolean? value
    	value.is_a?(TrueClass) || value.is_a?(FalseClass) 
    end
	end
end
