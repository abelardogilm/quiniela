#require 'io/console'

Resultado = []
ResultadoFinal = []
Porcentajes=[]

def inicia_resultado(num, vez = nil)

  cad = []
  if vez.present?
	  1..(num.to_i - vez).times do 
	    cad << 1
	  end
	  1..vez.times do
	    cad << 0
	  end
	  Resultado << cad
          cad = []
	  1..(num.to_i - vez).times do 
	    cad << 0
	  end
	  1..vez.times do
	    cad << 1
	  end
	  Resultado << cad
  else
	  val = 1
	  1..(num.to_i).times do 
	    val = (val + 1) % 2
	    cad << val
	  end

	  Resultado << cad
	  cad = []
	  val = 0
	  1..(num.to_i).times do 
	    val = (val + 1) % 2
	    cad << val
	  end
	  Resultado << cad
  end 
end

def valores(numT, numD, reduc)
 i1 = 1
 i2 = 1
 i3 = 1
 i4 = 1
 i5 = 1
 i6 = 1
 i7 = 1
 i8 = 1
 i9 = 1
 i10 = 1
 i11 = 1
 i12= 1
 i13 = 1
 i14 = 1

 cadena_ejecutar = ''
  posit = 1
  1..(numT.to_i + numD.to_i).times do
	cadena_ejecutar += "1..#{posit > numT.to_i ? 2 : 3}.times do\n"
  	posit += 1
  end

  cadena_ejecutar += "cad = [i1"
  pos = 2
  2..(numT.to_i + numD.to_i - 1).times do
	cadena_ejecutar += ",i" + pos.to_s
	pos += 1
  end
  cadena_ejecutar += "]\n"
  cadena_ejecutar += "resultado(cad, reduc)\n"
  vals = numT.to_i + numD.to_i

  while vals > 0 do
	cadena_ejecutar += "i" + vals.to_s + " = (i" + vals.to_s + " + 1) % #{vals > numT.to_i ? 2 : 3}\n end \n"
	vals -= 1
  end
  eval cadena_ejecutar
end

def resultado(array, reduc)
  igual = 0
  if Resultado.blank?
	Resultado << array
  else
	Resultado.each do |res|
	  i = 0
	  while i < array.size do
	    igual += 1 if res[i] == array[i]
	    i += 1
	  end
	  if igual >= reduc.to_i - (14 - array.size)
	    break
	  else
	    igual = 0
	  end
	end
    if igual == 0
	Resultado << array
    end
  end
  
end

def porcentajes(numT, numD)
  i1 = 1
  i2 = 1
  i3 = 1
  i4 = 1
  i5 = 1
  i6 = 1
  i7 = 1
  i8 = 1
  i9 = 1
  i10 = 1
  i11 = 1
  i12= 1
  i13 = 1
  i14 = 1

 cad = []
 igual = 0
 vv = 0
 s = 0 
 c = 0
 cc = 0
 ccc = 0
 cccc = 0
 cont = 0


 cadena_ejecutar = ''
  posit = 1
  1..(numT.to_i + numD.to_i).times do
	cadena_ejecutar += "1..#{posit > numT.to_i ? 2 : 3}.times do\n"
  	posit += 1
  end
  cadena_ejecutar += "cont += 1 \n"
  cadena_ejecutar += "cad = [i1"
  pos = 2
  2..(numT.to_i + numD.to_i - 1).times do
	cadena_ejecutar += ",i" + pos.to_s
	pos += 1
  end
  cadena_ejecutar += "]\n"
cadena_ejecutar += " max = 0
ResultadoFinal.each do |v|
	i = 0
	  while i < v.size do
	    igual += 1 if v[i] == cad[i]
	    i += 1
	  end
	  max = igual if igual > max
	  igual = 0
    end
    if max >= #{numT.to_i + numD.to_i - 4}
	    s += 1 if max == #{numT.to_i + numD.to_i }		
	    c += 1 if max == #{numT.to_i + numD.to_i - 1}
	    cc += 1 if max == #{numT.to_i + numD.to_i - 2}
	    ccc += 1 if max == #{numT.to_i + numD.to_i - 3}
    	    cccc += 1 if max == #{numT.to_i + numD.to_i - 4}
	  end 
	\n"
  vals = numT.to_i + numD.to_i

  while vals > 0 do
	cadena_ejecutar += "i" + vals.to_s + " = (i" + vals.to_s + " + 1) % #{vals > numT.to_i ? 2 : 3}\n end \n"
	vals -= 1
  end
  eval cadena_ejecutar
  res = 0.0
  res = s.to_f / cont.to_f
  Porcentajes << ["14",s, (s.to_f / cont.to_f).round(4)]
  Porcentajes << ["13", c,(c.to_f / cont.to_f).round(4)]
  Porcentajes << ["12",cc, (cc.to_f / cont.to_f).round(4)]
  Porcentajes << ["11", ccc, (ccc.to_f / cont.to_f).round(4)]
  Porcentajes << ["10",cccc, (cccc.to_f / cont.to_f).round(4)]

end

task :calculaQuinielaTriple => :environment do

  p "Numero Dobles?"
  numeroDobles = STDIN.gets.chomp
  p "Numero Triples?"
  numeroTriples = STDIN.gets.chomp
  p "Reduccion?"
  reduccion = STDIN.gets.chomp

  numT = numeroDobles.to_i + numeroTriples.to_i

  p "Iniciando calculo de valores"
  p "Inicia contrapeado"
  inicia_resultado(numT)
  valores(numeroTriples, numeroDobles, reduccion)
  ResultadoFinal = Resultado
  vez = 0
  while vez < (numT / 2 - 1) do
    p "calculo para vez " + vez.to_s
    Resultado = []
    inicia_resultado(numT, vez)
    valores(numeroTriples, numeroDobles, reduccion)
    ResultadoFinal = Resultado if Resultado.size < ResultadoFinal.size
    vez += 1
  end
  p "#" * 50
  p "Reduccion minima encontrada para #{numeroTriples} triples y #{numeroDobles} dobles al #{reduccion} de reduccion:\t #{ResultadoFinal.size} Columnas" 
  p "#" * 50
  ResultadoFinal.each do |rr|
	p rr
  end


  p "Comprobando Porcentajes"
  porcentajes(numeroTriples, numeroDobles)
  Porcentajes.reverse.map {|f| p f[2]}

end

