function matrix2latexmatrix(matrix, filename, format)

% function: matrix2latexmatrix(...)
% Author:   N. Marcacci Rossi
% Contact:  nicolamr@gmail.com
% Version:  1.0
% Date:     September, 29, 2010

% This software is published under the GNU GPL, by the free software
% foundation. For further reading see: http://www.gnu.org/licenses/licenses.html#GPL
%
% Code adapted by Wim

% Usage:
% matrix2latexmatrix(matrix, filename, varargs)
% where
%   - matrix is a 2 dimensional numerical or cell array
%   - filename is a valid filename, in which the resulting latex code will
%   be stored
%
% Example input:
%   matrix = [1.5 1.764; 3.523 0.2];
%   matrix2latexmatrix(matrix,somefilename.tex,'%.4g')
%
% The resulting latex file can be included into any latex document by:
% /input{out.tex}
% 
%
% Enjoy life!!!'

    fid = fopen(filename, 'w');
    
    width = size(matrix, 2);
    height = size(matrix, 1);

    if isnumeric(matrix)
        matrix = num2cell(matrix);
        for h=1:height
            for w=1:width
                matrix{h, w} = num2str(matrix{h, w},format);
            end
        end
    end
    
    fprintf(fid, '\\begin{bmatrix}\r\n');
    
    for h=1:height
        for w=1:width-1
            if isnumeric(matrix{h, w})
                matrix{h, w} = num2str(matrix{h, w},format);
            end
            fprintf(fid, '%s&', matrix{h, w});
        end
        if isnumeric(matrix{h, width})
            matrix{h, width} = num2str(matrix{h, width},format);
        end
        fprintf(fid, '%s\\\\\r\n', matrix{h, width});
    end

    fprintf(fid, '\\end{bmatrix}\r\n');
    fclose(fid);
        
        
    
    
    
    