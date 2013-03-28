set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO


ALTER procedure [dbo].[Sp_Pagination]
       @querySql varchar(4000),
       @pageNum int,
       @pageSize int,
       @tmpName varchar(50)
      as
     begin
       declare @rcount int
       declare @index int
       declare @execsql varchar(4000)
       select @rcount=(@pageNum-1)*@pageSize+@pageSize
       select @index=(@pageNum-1)*@pageSize
       select @querySql=ltrim(@querySql)
       select @querySql=substring(@querySql,7,len(@querySql))
       select @execsql='select * from (select *,row_number()over(order by tempcolumn)temprownumber from ( '+
        'select top '+ convert(varchar,@rcount)+ ' *,tempcolumn=0 from (select top '+
         convert(varchar,@rcount)+@querySql+')magic)t)tt where temprownumber>'+convert(varchar,@index)
      print(@execsql)
	  execute (@execsql)
     end
