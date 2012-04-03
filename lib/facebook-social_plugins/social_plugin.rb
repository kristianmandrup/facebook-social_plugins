module FacebookSocialPlugins
	class SocialPlugin
		def initialize options = {}
			validate!
			@options = options
		end

		def render
			content_tag :div, render_options.merge(:class => plugin_class)
		end

		# the :special type indicates call to special type validator
		def validate!
			return if options.empty?
			options.each do |key, value|
				attributes[key] == :special ? send("validate_#{key}", value) : valid?(value, attributes[key])				
			end
		end

		protected

		# :width => 200 mapped to become 'data-width' => 200
		def render_options
			options.inject({}) {|res, opt| res["data-#{opt.first}"] = opt.last; res}
		end

		def plugin_class
			raise NotImplementedError, 'Must be implemented by subclass'
		end

		def attributes
			@attributes ||= {}
		end

		def valid? value, valid_type
			case valid_type
			when :string
				raise ArgumentError, "Must be a String, was #{value}" unless value.is_a?(String) || value.is_a?(Symbol)
			when :array
				raise ArgumentError, "Must be an Array or a String, was #{value}" unless value.is_a?(String) || value.is_a?(Symbol) || value.is_a?(Array)
			when :integer
				raise ArgumentError, "Must be a Fixnum, was #{value}" unless value.is_a?(Fixnum)
			when :boolean
				raise ArgumentError, "Must be a Boolean, was #{value}" unless value.is_a?(Boolean)
			when Array
				raise ArgumentError, "Must be a one of #{valid_type.inspect}, was #{value}" unless valid_type.include?(value.to_s)
			end
		end
	end
end
