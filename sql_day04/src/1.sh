#!/bin/bash
day=4
tasks=8

# Генерация первых 10 файлов
for i in $(seq -w 0 9); do
   mkdir "ex0$i"
   touch "day0${day}_ex0$i.sql"
   mv "day0${day}_ex0$i.sql" "ex0$i"
done

if (( tasks > 10 )); then
   left=$((tasks - 10))
   # Генерация файлов для оставшихся задач
   for i in $(seq -w 0 $left); do
      mkdir "ex1$i"
      touch "day0${day}_ex1$i.sql"
      mv "day0${day}_ex1$i.sql" "ex1$i"
   done
else
   echo "complete"
fi

echo "complete"