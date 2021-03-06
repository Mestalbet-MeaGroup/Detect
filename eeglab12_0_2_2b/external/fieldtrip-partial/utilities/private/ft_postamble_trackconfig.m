% FT_POSTAMBLE_TRACKCONFIG is a helper script that requests ft_checkconfig
% to switch off the (optional) configuration tracking and to report on the
% used and unused options and/or clean up the output cfg structure. This
% should be used together with FT_PREAMBLE_TRACKCONFIG.

% Copyright (C) 2011-2012, Robert Oostenveld, DCCN
%
% This file is part of FieldTrip, see http://www.ru.nl/neuroimaging/fieldtrip
% for the documentation and details.
%
%    FieldTrip is free software: you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation, either version 3 of the License, or
%    (at your option) any later version.
%
%    FieldTrip is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%
%    You should have received a copy of the GNU General Public License
%    along with FieldTrip. If not, see <http://www.gnu.org/licenses/>.
%
% $Id: ft_postamble_trackconfig.m 5113 2012-01-11 07:57:16Z roboos $

% otherwise the empty field would end up in the output cfg
global ft_default
ft_default = rmfield(ft_default, 'postamble');

% accessing this field here is needed for the configuration tracking
% by accessing it once, it will not be removed from the output cfg
if isfield(cfg, 'outputfile')
  cfg.outputfile;
end
if isfield(cfg, 'outputlock')
  cfg.outputlock;
end

% get the output cfg
cfg = ft_checkconfig(cfg, 'trackconfig', 'off', 'checksize', 'yes');

% the calling ft_postamble expects it to be present
ft_default.postamble = {};
