function RG = Conversion
    radianes=(0:0.1*pi:2*pi);
    grados=(180/pi)*radianes;
    radianes=radianes';
    grados=grados';
    RG=table(radianes,grados);
end