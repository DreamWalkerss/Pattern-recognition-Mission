load digitStruct.mat
for i = 1:length(digitStruct)
    im = imread([digitStruct(i).name]);
    fid=['D:\datasets\SVHN\test\labels\',num2str(i),'.txt'];
    for j = 1:length(digitStruct(i).bbox)
        
        [height, width,channel] = size(im);
        %aa = max(digitStruct(i).bbox(j).top+1,1);
        bb = min(digitStruct(i).bbox(j).top+digitStruct(i).bbox(j).height, height);
        %cc = max(digitStruct(i).bbox(j).left+1,1);
        dd = min(digitStruct(i).bbox(j).left+digitStruct(i).bbox(j).width, width);
        center_x=(digitStruct(i).bbox(j).left+dd)/(2*width);
        center_y=(digitStruct(i).bbox(j).top+bb)/(2*height);
        labwidth=digitStruct(i).bbox(j).width/width;
        labheight=digitStruct(i).bbox(j).height/height;
        lablewrt=[digitStruct(i).bbox(j).label,center_x,center_y,labwidth,labheight];
        %imshow(im(aa:bb, cc:dd, :));
        f=fopen(fid,"a");
        fprintf(f,'%d %.6f %.6f %.6f %.6f\r\n',lablewrt);
        fclose(f);
        %pause;
    end
end