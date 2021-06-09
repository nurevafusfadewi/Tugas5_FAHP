namaMahasiswa = {'Eva' 'Lisa' 'Erma' 'Diva' 'Syukur' 'Randi' 'Mawar' 'Himka'};

data = [ 91 70 80
         80 70 89
         80 75 65
         90 75 64
         80 90 80
         70 90 89
         88 96 90
         97 97 70];

nilaiFisika = 100;
nilaiKimia = 100;
nilaiBiologi = 100;

data(:,1) = data(:,1) / nilaiFisika;
data(:,2) = data(:,2) / nilaiKimia;
data(:,3) = data(:,3) / nilaiBiologi;

relasiAntarKriteria = [ 1     2     2
                        0     1     4
                        0     0     1];
 
TFN = {[-100/3 0     100/3]     [3/100  0     -3/100]
       [0      100/3 200/3]     [3/200  3/100 0     ]
       [100/3  200/3 300/3]     [3/300  3/200 3/100 ]
       [200/3  300/3 400/3]     [3/400  3/300 3/200 ]};                    
                    
[RasioKonsistensi] = HitungKonsistensiAHP(relasiAntarKriteria)
if RasioKonsistensi < 0.10
    % Metode Fuzzy AHP
    [bobotAntarKriteria, relasiAntarKriteria] = FuzzyAHP(relasiAntarKriteria, TFN);    

    % Hitung nilai skor akhir 
    ahp = data * bobotAntarKriteria';
    
    disp('Hasil Perhitungan dengan metode Fuzzy AHP')
    disp('Nama Mahasiswa, Skor Akhir, Kesimpulan')
end

    for i = 1:size(ahp, 1)
        if ahp(i) < 0.5
            status = 'Kurang';
        elseif ahp(i) < 0.75
            status = 'Cukup';
        elseif ahp(i) >= 0.75
            status = 'Baik';
        end
        
        disp([char(namaMahasiswa(i)), blanks(13 - cellfun('length',namaMahasiswa(i))), ', ', ... 
             num2str(ahp(i)), blanks(10 - length(num2str(ahp(i)))), ', ', ...
             char(status)])
    end



