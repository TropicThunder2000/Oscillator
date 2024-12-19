classdef oscillator_class
    %UNTITLED5 Summary of this class goes here
    %   Detailed explanation goes here
    properties
        inc
        buffer_size
        pre_val
    end

    methods
        function obj = oscillator_class(f_o,fs,buffer_size)
            %UNTITLED5 Construct an instance of this class
            %   Detailed explanation goes here
            obj.inc = f_o/fs;
            obj.buffer_size = buffer_size;
            obj.pre_val = 0;
        end

        function [output_buffer,obj] = processsaw(obj)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            output_buffer = zeros(obj.buffer_size, 1);
            for b = 1:obj.buffer_size
                output_buffer(b) = obj.pre_val*2-1;
                obj.pre_val = obj.pre_val + obj.inc;
                
                if obj.pre_val > 1
                    obj.pre_val = 0;
                end
            end

        end

        function [output_buffer,obj] = processtriangle(obj)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            output_buffer = zeros(obj.buffer_size, 1);
            for b = 1:obj.buffer_size
                output_buffer(b) = obj.pre_val*2-1;
                obj.pre_val = obj.pre_val + obj.inc;
                
                if obj.pre_val > 1
                    obj.pre_val = 0;
                end
            end
            output_buffer = abs(output_buffer);
        end

        function [output_buffer,obj] = processsine(obj)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            output_buffer = zeros(obj.buffer_size, 1);
            for b = 1:obj.buffer_size
                output_buffer(b) = obj.pre_val*2-1;
                obj.pre_val = obj.pre_val + obj.inc;
                
                if obj.pre_val > 1
                    obj.pre_val = 0;
                end
            end
            output_buffer = sin(2 * pi * output_buffer);
        end

        function [output_buffer,obj] = processsquare(obj)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            output_buffer = zeros(obj.buffer_size, 1);
            for b = 1:obj.buffer_size
                output_buffer(b) = sign(obj.pre_val);
                obj.pre_val = obj.pre_val + obj.inc;
                
                if obj.pre_val > 1
                    obj.pre_val = 0;
                end
            end

        end
    end
end