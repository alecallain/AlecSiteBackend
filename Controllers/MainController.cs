using AlecSiteBackend.Services;
using Microsoft.AspNetCore.Mvc;
using Asp.Versioning;

namespace AlecSiteBackend.Controllers;

[ApiController]
[ApiVersion("1.0")]
[Route("api/v{version:apiVersion}/[controller]")]
public class MainController(IInfoService infoService) : ControllerBase
{
    private readonly IInfoService _infoService = infoService;
    
    [HttpGet("status")]
    public IActionResult GetStatus()
    {
        return Ok();
    }
}