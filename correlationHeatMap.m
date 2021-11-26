%% Author : Amirhossein Samavi(amirhosseinsamavi79@gmail.com)
%% Date : 25 November 2021

% Put your own carrolation matrix here
r=[
1	0.746073065	0.726511238	0.676930697	0.441019454	0.17791063	0.392279558	0.276684857	0.025732999
0.746073065	1	0.903217293	0.925702081	0.524949429	0.194669321	0.501376118	0.324540253	0.039598124
0.726511238	0.903217293	1	0.90538268	0.791441032	0.051172809	0.594623888	0.423753729	0.077500299
0.676930697	0.925702081	0.90538268	1	0.749543151	0.044875568	0.565621907	0.39843796	0.081715142
0.441019454	0.524949429	0.791441032	0.749543151	1	0.221578302	0.566810121	0.455643724	0.267737506
0.17791063	0.194669321	0.051172809	0.044875568	0.221578302	1	0.39780771	0.578749046	0.83091715
0.392279558	0.501376118	0.594623888	0.565621907	0.566810121	0.39780771	1	0.939720392	0.682017954
0.276684857	0.324540253	0.423753729	0.39843796	0.455643724	0.578749046	0.939720392	1	0.859193318
0.025732999	0.039598124	0.077500299	0.081715142	0.267737506	0.83091715	0.682017954	0.859193318	1
];

%r = abs(1-r);

% Cusomize with your own font
fn='Times New Roman';
set(0,'DefaultAxesFontName',fn);
set(0,'DefaultAxesFontSize',9);
set(0,'DefaultTextFontSize',9.9);
set(0,'DefaultTextFontName',fn);

% Labels
Xlabels = [ "Drift"	'{\itT2B}'	"{\itL2R}"	"{\itR2L}"	"{\itB2T}"	"{\itLC}"	"{\itD_-_1}"	'{\itD_0}'	'{\itD_+_1}'];
Ylabels = Xlabels;
% scatter plot
n = size(r, 1);
y = triu(repmat(n+1, n, n) - (1:n)') + 0.5;
x = triu(repmat(1:n, n, 1)) + 0.5;
x(x == 0.5) = NaN;
scatter(x(:), y(:), 1500, r(:), 'filled', "s", 'MarkerFaceAlpha', 0.6)

% enclose markers in a grid
xl = [1:n+1;repmat(n+1, 1, n+1)];
xl = [xl(:, 1), xl(:, 1:end-1)];
yl = repmat(n+1:-1:1, 2, 1);
line(xl, yl, 'color', 'k') % horizontal lines
line(yl, xl, 'color', 'k') % vertical lines

% show labels
A(1:n) = n + 1.15;
text(A, (n:-1:1) + 0.5, Ylabels, 'HorizontalAlignment', 'right')
text((1:n) + 0.5, repmat(n + 1.15, n, 1), Xlabels, ...
    'HorizontalAlignment', 'right', 'Rotation', 90)
h = gca;
colorbar(h);
h.Visible = 'off';
h.Position(4) = h.Position(4)*0.9;
axis(h, 'equal')

%Put your gradiant colors here
map = [
    0.9 0.9 1
    0.85 0.85 1
    0.80 0.80 1
    0.75 0.75 1
    0.70 0.70 1
    0.64 0.64 1
    0.60 0.60 1
    0.55 0.55 1
    0.50 0.50 1
    0.45 0.45 1
    0.40 0.40 1
    0.35 0.35 1
    0.29 0.29 1
    0.25 0.25 1
    0.20 0.20 1
    0.12 0.12 1
    0.07 0.07 1
    0 0 1
];
colormap(map)


% numberts in squares
numLabels = [
1.00	0.75	0.73	0.68	0.44	0.18	0.39	0.28	0.03
0.00	1.00	0.90	0.93	0.52	0.19	0.50	0.32	0.04
0.00	0.00	1.00	0.91	0.79	0.05	0.59	0.42	0.08
0.00	0.00	0.00	1.00	0.75	0.04	0.57	0.40	0.08
0.00	0.00	0.00	0.00	1.00	0.22	0.57	0.46	0.27
0.00	0.00	0.00	0.00	0.00	1.00	0.40	0.58	0.83
0.00	0.00	0.00	0.00	0.00	0.00	1.00	0.94	0.68
0.00	0.00	0.00	0.00	0.00	0.00	0.00	1.00	0.86
0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	1.00
];

for j=1:n
    for i=j:n
        str = num2str(numLabels(j, i));
        if(i == j)
            padding = 0; 
        else 
            padding = 0.1; 
        end
        text(i + 0.65 + padding , n - j + 1.46,str);
    end
end

set(gca, 'YDir','reverse')
set(gca, 'XDir','reverse')

