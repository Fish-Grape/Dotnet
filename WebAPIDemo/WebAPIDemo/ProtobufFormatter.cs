using Microsoft.AspNetCore.Mvc.Formatters;
using Microsoft.Net.Http.Headers;
using ProtoBuf;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebAPIDemo
{
    public class ProtobufFormatter : OutputFormatter
    {
        public string ContentType { get; private set; }

        public ProtobufFormatter()
        {
            ContentType = "application/proto";
            SupportedMediaTypes.Add(MediaTypeHeaderValue.Parse(ContentType));
        }

        public override Task WriteResponseBodyAsync(OutputFormatterWriteContext context)
        {
            if (context == null)
            {
                throw new ArgumentNullException(nameof(context));
            }
            var response=context.HttpContext.Response;
            Serializer.Serialize(response.Body,context.Object);
            return Task.FromResult(0);
        }
    }
}
